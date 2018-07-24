class profile::mediaserver {
  include 'docker'

  docker_compose { '/tmp/docker-compose.yml':
    ensure      => present,
    options     => '--project-name mediaserver',
  }

  file { '/tmp/docker-compose.yml':
    ensure      => file,
    source      => 'puppet:///files/docker/docker-compose.yml',
  }
}
