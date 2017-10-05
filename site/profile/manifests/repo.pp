class profile::repo {

  class { 'apache':
  default_vhost => false,
  }

  # Ensure the vhosts directory exists
  file { '/var/www/html/vhosts':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  # vhost definitions
  apache::vhost { 'srv':
  port    => '80',
  docroot => '/var/www/html/vhosts/srv',
  }
}
