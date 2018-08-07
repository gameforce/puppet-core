class profile::apache {

  # include apache
  class { 'apache':
  default_vhost => false,
  }

  # enable apache modules
  class { 'apache::mod::ssl': }
  class { 'apache::mod::wsgi': }

  # enable arbitrary modules
  class { 'apache::mod::socache_shmcb_module':
    loadfile_name => 'modules/mod_socache_shmcb.so'
  }
}
