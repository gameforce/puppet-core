class profile::mediaserver {
  include 'docker'

  docker_compose { '/tmp/docker-compose.yml':
    ensure      => present,
    options     => '--project-name mediaserver',
    subscribe   => File['/tmp/docker-compose.yml'],
  }

  file { '/tmp/docker-compose.yml':
    ensure      => file,
    source      => 'puppet:///files/docker/docker-compose.yml',
  }
}
