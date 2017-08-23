class profile::vhosts {

  # Ensure the vhosts directory exists
  file { '/var/www/html/vhosts':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  apache::vhost { 'srv':
  port    => '80',
  docroot => '/var/www/html/vhosts/srv',
  }

}
