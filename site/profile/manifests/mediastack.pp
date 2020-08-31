class profile::mediastack {
  include 'docker'

  docker_compose { 'mediastack':
    compose_files => ['/mediastack/mediastack.yaml'],
    ensure        => present,
  }

  file { '/mediastack':
    ensure => directory,
  }

  file { '/mediastack/mediastack.yaml':
    ensure => file,
    source => 'puppet:///modules/profile/docker/mediastack.yaml',
  }
}
