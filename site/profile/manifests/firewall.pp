class profile::firewall {

  # includes
  include firewall

  class { 'firewall':
    ensure => 'stopped',
  }

  #service { 'iptables':
  #  ensure => 'stopped',
  #  enable => 'false',
  #}

}
