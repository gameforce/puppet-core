class profile::dnsserver {

  class { 'bind': }
    forwarders => [
        '192.168.11.10',
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
}
