class profile::dhcp {

  # dhcp server config for owi.lan
  class { 'dhcp':
    service_ensure => running,
    dnsdomain      => [
      'gameforce.net',
      '11.168.192.in-addr.arpa',
    ],
    nameservers    => ['192.168.11.7'],
    ntpservers     => ['centos.pool.ntp.org'],
    interfaces     => ['eth0'],
    dnsupdatekey   => '/etc/rndc.key',
    dnskeyname     => 'rndc-key',
    #require      => Bind::Key['rndc-key'],
    pxeserver      => '192.168.11.10',
    pxefilename    => 'pxelinux.0',
    ipxe_filename  => 'undionly.kpxe',
    ipxe_bootstrap => 'http://kickstart/boot.ipxe',
    omapi_port     => 7911,
  }

  # define the pool
  dhcp::pool{ 'pool.gameforce.net':
    network        => '192.168.11.0',
    mask           => '255.255.255.0',
    range          => ['192.168.88.100 192.168.88.200'],
    gateway        => '191.168.11.254',
  }

  # ignored subnet (aws)
  dhcp::ignoredsubnet{ 'eth0':
    network        => '172.31.0.0',
    mask           => '255.255.0.0',
  }

  # host reservations
  # dhcp::host { 'server1': mac => '00:50:56:00:00:01', ip => '10.0.1.51', }
}
