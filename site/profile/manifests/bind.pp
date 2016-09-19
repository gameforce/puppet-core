class profile::bind {

  include bind

  bind::server::conf { '/etc/named.conf':
    listen_on_addr          => [ 'any' ],
    listen_on_v6_addr       => [ 'false' ],
    forwarders              => [ '192.168.11.10', '8.8.8.8', '8.8.4.4' ],
    allow_query             => [ 'localnets' ],
    includes                => [ '/etc/named.root.key' ],
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
        'secret "5SRbPvnrL3m72JxYsaYnxw=="',
      ],
    }
  }
  bind::server::file { 'gameforce.net':
  source => 'puppet:///puppet-files/bind/gameforce.net',
  #ensure => 'present',
  #  }

  bind::server::file { '1.168.192.in-addr.arpa':
  source => 'puppet:///puppet-files/bind/11.168.192.in-addr.arpa',
  #ensure => 'present',
  #  }
}
