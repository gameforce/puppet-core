class profile::docker {
  class { 'docker':
    use_upstream_package_source => false,
    version => '1.2.13-2-0~focal',
}

  # ensure docker-compose is present
  class {'docker::compose':
    ensure  => present,
    version => '1.9.0',
  }
}
