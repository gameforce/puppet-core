class profile::firewall::off {

  # enable firewall
  class { 'firewall':
    ensure => 'stopped',
  }
}
