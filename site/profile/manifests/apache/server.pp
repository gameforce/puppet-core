class profile::apache::server {

  class { 'apache':
    default_vhost => true,
  }

  # install additional mods
  class { 'apache::mod::ssl': }
  class { 'apache::mod::wsgi':
    wsgi_socket_prefix => '/var/run/wsgi',
  }

  # Ensure the vhosts directory exists
  file { '/var/www/html/vhosts':
    ensure => 'directory',
  }
}
