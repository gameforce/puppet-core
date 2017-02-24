class profile::vhosts {

  apache::vhost { 'kam':
  port    => '80',
  docroot => '/var/www/kam',
  }
}
