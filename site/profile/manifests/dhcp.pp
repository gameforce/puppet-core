class profile::dhcp {

  class { 'dhcp':
    service_ensure => running,
    dnsdomain      => [
      'gameforce.net',
      '11.168.192.in-addr.arpa',
    ],
    nameservers   => ['192.168.11.10', '8.8.8.4'],
    ntpservers    => ['us.pool.ntp.org'],
    interfaces    => ['enp11s0'],
    # dnsupdatekey  => '/etc/bind/rndc.key',
    # dnskeyname    => 'rndc-key',
    # require       => Bind::Key['test'],
    pxeserver     => '192.168.11.10',
    pxefilename   => 'pxelinux.0',
    omapi_port    => 7911,
    }
  
  dhcp::pool { 'gameforce.net':
    network      => '192.168.11.0',
    mask         => '255.255.255.0',
    range        => ['192.168.11.100', '192.168.11.200'],
    gateway      => '192.168.11.254',
  }
  
  dhcp::host { 'ayla'   : mac  => '6c:ad:f8:74:ff:d2', ip => '192.168.11.2', }
  dhcp::host { 'kylo'   : mac  => 'c4:3d:c7:a3:0d:10', ip => '192.168.11.3', }
  dhcp::host { 'ahsoka' : mac  => 'c4:b3:01:ba:43:e1', ip => '192.168.11.4', }
  dhcp::host { 'anakin' : mac  => '68:5b:35:bf:25:98', ip => '192.168.11.5', }
  dhcp::host { 'sheev'  : mac  => '90:2b:34:31:da:a3', ip => '192.168.11.6', }
  dhcp::host { 'yoda'   : mac  => '58:40:4e:a8:f0:45', ip => '192.168.11.7', }
  dhcp::host { 'leia'   : mac  => 'fc:d8:48:f2:a6:c4', ip => '192.168.11.8', }
  dhcp::host { 'obiwan' : mac  => '00:18:8b:25:ad:a8', ip => '192.168.11.10', }
}
