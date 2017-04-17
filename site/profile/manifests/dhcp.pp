class profile::dhcp {

 class { 'dhcp':
  service_ensure => running,
  dnsdomain      => [
    'gameforce.net',
    '11.168.192.in-addr.arpa',
  ],
  nameservers  => ['192.168.11.10'],
  ntpservers   => ['us.pool.ntp.org'],
  interfaces   => ['enp11s0'],
  dnsupdatekey => '/etc/bind/rndc.key',
  dnskeyname   => 'rndc-key',
  require      => Bind::Key['rndc-key'],
  pxeserver    => '192.168.11.10',
  pxefilename  => 'pxelinux.0',
  omapi_port   => 7911,
  }
}
