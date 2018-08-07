class profile::apache {

  # include apache
  class { 'apache':
  default_vhost => false,
  }

  # enable apache modules
  class { 'apache::mod::ssl': }
  class { 'apache::mod::wsgi': }

  # enable arbitrary modules
  class { 'apache::mod::mod_socache_shmcb.so':
    loadfile_name => 'modules/mod_socache_shmcb.so'
  }
}
