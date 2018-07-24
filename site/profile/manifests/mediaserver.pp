class profile::mediaserver {
  include 'docker'

  docker_compose { 'mediaserver':
    ensure      => present,
    #options     => '-p mediaserver',
    name        => '/tmp/docker-compose.yml',
  }

  file { '/tmp/docker-compose.yml':
    ensure      => file,
    source      => 'puppet:///files/docker/docker-compose.yml',
  }
}
