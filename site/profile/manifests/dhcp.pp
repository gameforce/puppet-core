class profile::dhcp {

class { '::dhcpd':
  configsource  => 'puppet:///puppet-files/dhcp/dhcpd.conf',
# Default is to enable but allow to be stopped (for active/passive)
  ensure => 'running',
  }
}
