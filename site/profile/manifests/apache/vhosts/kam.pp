class profile::apache::vhosts::kam {

  # vhost definitions: kickstart
  apache::vhost { 'kam':
  port    => '80',
  docroot => '/var/www/html/vhosts/kam',
  options => ['+FollowSymLinks', '-Indexes']
  }
}
