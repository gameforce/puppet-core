class profile::dhcp {

class { '::dhcpd':
  configcontent => template('dhcpd/dhcpd.conf-simple.erb'),
}


}
