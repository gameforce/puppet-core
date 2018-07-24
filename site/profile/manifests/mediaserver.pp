class profile::mediaserver {
  include 'docker'

  docker_compose { '/tmp/docker-compose.yml':
    ensure      => present,
    options     => '-p mediaserver',
  }

  file { '/tmp/docker-compose.yml':
    ensure      => file,
    source      => 'puppet:///files/docker/docker-compose.yml',
  }
}
