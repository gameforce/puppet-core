class profile::dhcpd { '::dhcpd':
  configcontent => template('dhcpd/dhcpd.conf-simple.erb'),
}
