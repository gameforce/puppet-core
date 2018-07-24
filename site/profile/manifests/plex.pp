class profile::plex {
  include 'docker'
  Exec { environment => [ "COMPOSE_PROJECT_NAME=plex" ] }

  docker_compose { 'plex':
    ensure      => present,
    name        => '/tmp/docker-compose-plex-host.yml',
    options     => '-p plex',
  }

  file { '/tmp/docker-compose-plex-host.yml':
    ensure      => file,
    source      => 'puppet:///files/docker/docker-compose-plex-host.yml',
  }
}
