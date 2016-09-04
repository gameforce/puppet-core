class gameforce::bind {

  include bind

  bind::server::conf { '/etc/named.conf':
    listen_on_addr    => [ 'any' ],
    listen_on_v6_addr => [ 'any' ],
    forwarders        => [ '8.8.8.8', '8.8.4.4' ],
    allow_query       => [ 'localnets' ],
    zones             => {
      'gameforce.net' => [
        'type master',
        'file "static.gameforce.net"',
      ],
      '11.168.192.in-addr.arpa' => [
        'type master',
        'file "11.168.192.in-addr.arpa"',
      ],
    },
  }
}
