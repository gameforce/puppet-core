class  profile::puppet::puppetdb {

  # Configure puppetdb and its underlying database
  class { 'puppetdb':
    listen_address  =>  '0.0.0.0',
    ssl_listen_port => '8081',
  }

  # Configure the Puppet master to use puppetdb
  class { 'puppetdb::master::config': }
}
