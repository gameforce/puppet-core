class profile::apache::vhosts::kickstart {

  # vhost definitions: kickstart
  apache::vhost { 'kickstart':
  port    => '80',
  docroot => '/var/www/html/vhosts/kickstart',
  }
}
