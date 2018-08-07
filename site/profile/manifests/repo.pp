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

  # vhost definitions: kickstart
  apache::vhost { 'kickstart':
  port    => '80',
  docroot => '/var/www/html/vhosts/kickstart',
  }

  cron { 'repo_sync':
    command     => '/net/systems/bin/centos_mirror_repo.sh',
    hour        => '2-4',
    monthday    => '1',
    user        => 'root',
  }
}
