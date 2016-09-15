# profile::r10k
class profile::r10k {

class { 'r10k':
  remote => 'git@github.com:gameforce/puppet-core.git',
  }

class { '::r10k::webhook::config':
  protected        => false,
  public_key_path  => '/etc/mcollective/server_public.pem',  # Mandatory for FOSS
  private_key_path => '/etc/mcollective/server_private.pem', # Mandatory for FOSS
  notify           => Service['webhook'],
  }

class { '::r10k::webhook':
  user    => 'puppet',                                       # Mandatory for FOSS
  group   => 'puppet',                                       # Mandatory for FOSS
  require => Class['::r10k::webhook::config'],
  }
}
