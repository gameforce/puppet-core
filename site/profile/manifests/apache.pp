class profile::apache {

  # include apache
  class { 'apache':
  default_vhost => false,
  }

  # enable apache modules
  class { 'apache::mod::ssl': }
  class { 'apache::mod::shmcb': }
  class { 'apache::mod::wsgi': }
}
