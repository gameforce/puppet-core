#class profile::dhcpd {

#  configsource => 'puppet:///modules/profile/dhcp/dhcpd.conf',
#  # Restrict listening to a single interface
#  dhcpdargs => 'eth0',
#  # Default is to enable but allow to be stopped (for active/passive)
#  ensure => 'running',

#include dhcpd

# Variables used from inside the template
$dhcpd_netmask             = '255.255.255.0'
$dhcpd_subnet              = '192.168.11.0'
$dhcpd_routers             = '192.168.11.254'
$dhcpd_domain_name_servers = '192.168.11.10,192.168.11.254'
$dhcpd_range_start         = '100'
$dhcpd_range_end           = '254'
$dhcpd_default_lease_time  = '3600'
$dhcpd_max_lease_time      = '21600'
class { 'profile::dhcpd':
    configcontent => template('dhcpd/dhcpd.conf-simple.erb'),
      ensure      => 'running',
      }
#}
