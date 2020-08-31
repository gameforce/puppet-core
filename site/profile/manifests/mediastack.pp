class profile::mediastack {
  include 'docker'

  docker_compose { 'mediastack':
    ensure => present,
    name   => '/mediastack/mediastack.yaml',
  }

  file { '/mediastack':
    ensure => directory,
  }

  file { '/mediastack/mediastack.yaml':
    ensure => file,
    source => 'puppet:///modules/profile/docker/mediastack.yaml',
  }
}
