class  profile::puppet::puppetdb {

  # Configure puppetdb and its underlying database
  class { 'puppetdb':
    listen_address  => '0.0.0.0',
    manage_firewall => false,
    manage_redhat_firewall => false,
    manage_debian_firewall => false,
  }

  # Configure the Puppet master to use puppetdb
  class { 'puppetdb::master::config': }
}
