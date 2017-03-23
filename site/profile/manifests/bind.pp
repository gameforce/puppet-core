class profile::bind {

  include bind

  bind::server::conf { '/etc/bind/named.conf':
    listen_on_addr          => [ 'any' ],
    listen_on_v6_addr       => [ 'false' ],
    forwarders              => [ '8.8.8.8', '8.8.4.4' ],
    allow_query             => [ 'localnets' ],
    includes                => [ '/etc/bind/rndc.key','/etc/bind/named.conf.options','/etc/bind/named.conf.local','/etc/bind/named.conf.default-zones' ],
    managed_keys_directory  => '/var/named/dynamic',
    zones                   => {
      'gameforce.net'       => [
        'type master',
        'file "gameforce.net"',
        'allow-update {key "rndc-key";}',
      ],
      '11.168.192.in-addr.arpa' => [
        'type master',
        'file "11.168.192.in-addr.arpa"',
        'allow-update {key "rndc-key";}',
      ],
    },

    keys                 => {
      'rndc-key' => [
        'algorithm hmac-md5',
        'secret "7zKqnVUkLJGi6kupQiYfPQ=="',
      ],
    }
  }
  bind::server::file { 'gameforce.net':
  source => 'puppet:///files/bind/gameforce.net',
  ensure => 'present',
  }

  bind::server::file { '11.168.192.in-addr.arpa':
  source => 'puppet:///files/bind/11.168.192.in-addr.arpa',
  ensure => 'present',
  }
}
