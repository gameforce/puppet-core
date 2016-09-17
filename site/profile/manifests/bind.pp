class profile::bind {

  class { 'bind':
    forwarders => [
        '8.8.8.8',
        '8.8.4.4',
    ],
    dnssec     => true,
    version    => 'Controlled by Puppet',
  }

  bind::key { 'local-update':
      algorithm => 'algorithm hmac-md5', # default: 'hmac-sha256'
      secret    => 'SV3fnrr+xInr/57va9qMRA==',
      owner     => 'root',
      group     => 'bind',
  }

  bind::zone { 'gameforce.net':
    zone_type       => 'master',
    domain          => 'gameforce.net',
    allow_updates   => [ 'key local-update', ],
    ns_notify       => true,
    dnssec          => true,
  }
  ##include profile::bind::records
}
