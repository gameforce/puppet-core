class profile::firewall::on {

  # enable firewall
  class { 'firewall':
    ensure => 'running',
  }
}
