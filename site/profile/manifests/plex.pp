class profile::plex {
  include 'docker'

  docker_compose { 'plex':
    ensure      => present,
    name        => '/plex/docker-compose-plex.yml',
  }

  file { '/plex':
    ensure      => directory,
  }

  file { '/plex/docker-compose-plex-host.yml':
    ensure      => file,
    source      => 'puppet:///files/docker/docker-compose-plex.yml',
  }
}
