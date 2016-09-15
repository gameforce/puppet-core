class profile::bind {

  include bind

  bind::server::conf { '/etc/named.conf':
    listen_on_addr         => [ 'any' ],
    listen_on_v6_addr      => [ 'any' ],
    forwarders             => [ '192.168.11.10', '8.8.8.8', '8.8.4.4' ],
    allow_query            => [ 'localnets' ],
    includes               => [ '/etc/named.root.key' ],
    managed_keys_directory => '/var/named/dynamic',

    zones             => {
      'gameforce.net' => [
        'type master',
        'file "dynamic/gameforce.net"',
        'allow-update {key "rndc-key";}',
      ],
      '11.168.192.in-addr.arpa' => [
        'type master',
        'file "dynamic/11.168.192.in-addr.arpa"',
        'allow-update {key "rndc-key";}',
      ],
    },
    keys                 => {
      'rndc-key'         => [
        'algorithm hmac-md5',
        'secret "SV3fnrr+xInr/57va9qMRA=="',
      ],
  }
}

  bind::server::file { 'dynamic/gameforce.net':
    #source => 'puppet:///puppet-files/bind/gameforce.net',
    ensure  => 'present',
    }

  bind::server::file { 'dynamic/11.168.192.in-addr.arpa':
    #source => 'puppet:///puppet-files/bind/11.168.192.in-addr.arpa',
    ensure  => 'present',
    }
}
