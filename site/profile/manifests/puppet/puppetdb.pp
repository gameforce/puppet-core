class  profile::puppet::puppetdb {

  # Configure puppetdb and its underlying database
  class { 'puppetdb':
    listen_address  => '0.0.0.0',
    manage_firewall => 'true'
  }

  # Configure the Puppet master to use puppetdb
  class { 'puppetdb::master::config': }
}
