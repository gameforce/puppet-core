class profile::apache {

  # include apache
  class { 'apache':
  default_vhost => false,
  }

  # vhost definition for vip
  apache::vhost { 'vip.gameforce.net':
  port    => '8080',
  docroot => '/var/www/html/vhosts/vip',
  }

  # enable apache modules
  class { 'apache::mod::ssl': }
  class { 'apache::mod::wsgi': }
}
