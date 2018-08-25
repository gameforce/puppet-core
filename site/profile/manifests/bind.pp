class profile::bind {

  # bind config
  include bind
  bind::server::conf { '/etc/named.conf':
    listen_on_addr    => [ 'any' ],
    listen_on_v6_addr => [ 'any' ],
    forwarders        => [ '75.153.176.1', '75.153.176.9', '8.8.8.8', '8.8.4.4' ],
    allow_query       => [ 'localnets' ],
    zones             => {
      'gameforce.net' => [
        'type master',
        'file "gameforce.net"',
      ],
      '11.168.192.in-addr.arpa' => [
        'type master',
        'file "11.168.192.in-addr.arpa.lan"',
      ],
    },
    keys              => {
      'rndc-key' => [
        'algorithm hmac-md5',
        'secret "m6rlGOwKeHb0WEN54Fcjew=="',
      ],
    }
  }

  # file resource location
  bind::server::file { [ 'gameforce.net', '11.168.192.in-addr.arpa.net' ]:
  source_base => 'puppet:///modules/profile/bind/',
  }
}
