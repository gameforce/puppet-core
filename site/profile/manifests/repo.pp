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

  # vhost definitions: repo
  apache::vhost { 'repo':
  port    => '80',
  docroot => '/var/www/html/vhosts/repo',
  }

  # vhost definitions: kickstart
  apache::vhost { 'kickstart':
  port    => '80',
  docroot => '/var/www/html/vhosts/kickstart',
  }
}
