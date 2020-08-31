class profile::docker {
  class { 'docker':
    use_upstream_package_source => false,
    version                     => 'latest',
    docker_users                => 'darf',
}

  # ensure docker-compose is present
  class {'docker::compose':
    ensure  => present,
    version => '1.9.0',
  }
}
