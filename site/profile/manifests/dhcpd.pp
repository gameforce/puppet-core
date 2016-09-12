class { 'profile::dhcpd':
  configsource => 'puppet:///modules/profile/dhcp/dhcpd.conf',
  # Restrict listening to a single interface
  dhcpdargs => 'eth0',
  # Default is to enable but allow to be stopped (for active/passive)
  ensure => 'running',
}
