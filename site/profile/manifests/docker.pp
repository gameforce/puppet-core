class profile::docker {
  class { 'docker':
    use_upstream_package_source => true,
    #version                     => '5:19.03.12~3-0~ubuntu-focal',
}

  # ensure docker-compose is present
  class {'docker::compose':
    ensure  => present,
    #version => '1.9.0',
  }
}
