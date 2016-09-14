class profile::bind {

  include bind

  bind::server::conf { '/etc/named.conf':
    #listen_on_addr    => [ 'any' ],
    #listen_on_v6_addr => [ 'any' ],
    #forwarders        => [ '8.8.8.8', '8.8.4.4' ],
    #allow_query       => [ 'localnets' ],
    #zones             => {
    #  'gameforce.net' => [
    #    'type master',
    #    'file "gameforce.net"',
    #  ],
    #  '11.168.192.in-addr.arpa' => [
    #    'type master',
    #    'file "11.168.192.in-addr.arpa"',
    #  ],
    #},

  source => 'puppet:///puppet-files/bind/named.conf',

}

  }
  bind::server::file { 'gameforce.net':
    source => 'puppet:///puppet-files/bind/gameforce.net',
    }

  bind::server::file { '11.168.192.in-addr.arpa':
    source => 'puppet:///puppet-files/bind/11.168.192.in-addr.arpa',
    }
}
