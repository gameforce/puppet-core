class profile::apache::vhosts::vip {

  # vhost definition for vip
  apache::vhost { 'vip.gameforce.net':
  port    => '8080',
  docroot => '/var/www/html/vhosts/vip',
  }
}
