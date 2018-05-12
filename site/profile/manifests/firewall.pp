class profile::firewall {

  class { 'firewall':
    ensure => 'stopped',
  }

  #service { 'iptables':
  #  ensure => 'stopped',
  #  enable => 'false',
  #}
}
