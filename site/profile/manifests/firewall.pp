# firewall 
class profile::firewall {

  # disable firewall
  class { 'firewall':
    ensure => 'stopped',
  }
}
