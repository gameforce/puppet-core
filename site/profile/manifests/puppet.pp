# puppet master
class profile::puppet {

# Configure puppetdb and its underlying database
class { 'puppetdb':
  listen_address => '0.0.0.0',
  ssl_listen_port => '8181',
}

# Configure the Puppet master to use puppetdb
class { 'puppetdb::master::config': }

class { 'r10k':
  remote => 'git@github.com:gameforce/puppet-core.git',
  }

 sshkey { 'sidious.gameforce.net':
  ensure => present,
  type   => 'ssh-rsa',
  target => '/root/.ssh/known_hosts',
  key    => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWYx/JKvouHfs5Gnx/Hc/25MgW9LRCycqbLAYdcqBT1f7o7LYYYCHRmQGnUMJxYfAV/yJVmVYJ1guaORkcZQzfQv8ekDJitgnMUBiI4Vz3CMqvZA2aaWhTUN9VXtfjirsECD+BBDrsAOMMMPqM1iTLrCuNlCRZSFo4DqUTib2H8z3WeTbwye6QVcwGUloE7kF+DYtBUSDvmrMxd5dhz2TjzpMv3qzWJAoeC+gBpRM0PXSrQE0FBCmRPsIwrBZfo2Os40yxyfJ4IIeUHhjeIFqcozgSUsOXfYJKGoGwPAZ7fFQTeNYlgcIDStCS4R445mjZwU3XytQJ61SoA6tW2fqt root@sidious.gameforce.net'
 }

class { '::r10k::webhook::config':
  protected        => false,
  use_mcollective  => false,
  public_key_path  => "/etc/puppetlabs/puppet/ssl/ca/signed/${facts['fqdn']}.pem",
  private_key_path => "/etc/puppetlabs/puppet/ssl/private_keys/${facts['fqdn']}.pem",
  }

class { '::r10k::webhook':
  user  => 'puppet',
  group => 'puppet',
  }
}
