class profile::dnsserver {

  class { 'bind':
    forwarders => [
        '192.168.11.10',
        '8.8.8.8',
        '8.8.4.4',
    ],
    dnssec     => true,
    version    => 'Controlled by Puppet',
  }

  bind::key { 'update':
      algorithm   => 'hmac-sha256',
      secret      => "BIPZ6BABG4SA240hijj/2o1L39NYnIt1z8p08N+g2BY=",
      owner       => 'root',
      group       => 'named',
  }
}
