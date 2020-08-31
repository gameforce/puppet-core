class profile::docker {
  class { 'docker':
    use_upstream_package_source => false,
    version                     => '20.04.1~ce~3-0~focal',
}

  # ensure docker-compose is present
  class {'docker::compose':
    ensure  => present,
    version => '1.9.0',
  }
}
