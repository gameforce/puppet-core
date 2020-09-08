# common 
class profile::common {

  # disable firewall
  class { 'firewall':
    ensure => 'stopped',
  }
}
