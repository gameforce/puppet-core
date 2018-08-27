class profile::dns {

  # bind config
  include bind
  bind::server::conf { '/etc/named.conf':
    listen_on_addr         => [ 'any' ],
    listen_on_v6_addr      => [ 'any' ],
    forwarders             => [ '75.153.176.1', '75.153.176.9', '8.8.8.8', '8.8.4.4' ],
    allow_query            => [ 'localnets' ],
    #extra_options          => [ 'allow-update { key "rndc-key";}' ],
    extra_options          => [ 'allow-update { "any"; }'],
    managed_keys_directory => "/var/named/dynamic",
    zones                  => {
      'gameforce.net' => [
        'type master',
        'file "gameforce.net"',
      ],
      '11.168.192.in-addr.arpa' => [
        'type master',
        'file "11.168.192.in-addr.arpa.net"',
      ],
    },
    keys              => {
      'rndc-key' => [
        'algorithm hmac-md5',
        'secret "TW2FVff7Urf0rcTDcgVfj7Wc75qInk24BtwntmgCJ1rRYRpjqdL0t25UynBVoP3Rhjpy7bko3h4APJugb5igMw=="',
      ],
    }
  }

  # file resource location
  bind::server::file { [ 'gameforce.net', '11.168.192.in-addr.arpa.net' ]:
  source_base => 'puppet:///modules/profile/bind/',
  }
}
