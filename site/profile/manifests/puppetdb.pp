class profile::puppetdb {
  # Configure puppetdb and its underlying database
  
  class { 'puppetdb': 
  listen_port => 8082,
}
  
  # Configure the Puppet master to use puppetdb
  class { 'puppetdb::master::config': }
}
