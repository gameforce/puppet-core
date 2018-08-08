class profile::apache::apache {

  # include apache
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

  # enable apache modules
  class { 'apache::mod::ssl': }
  class { 'apache::mod::wsgi': }
}
