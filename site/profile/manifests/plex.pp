class profile::plex {
  include 'docker'

  file { '/tmp/docker-compose-plex-host.yml':
    ensure      => file,
    source      => 'puppet:///files/docker/docker-compose-plex-host.yml',
  }

  docker_compose { '/tmp/docker-compose-plex-host.yml':
    ensure      => present,
    #subscribe   => File['/tmp/docker-compose-plex-host.yml'],
  }
}
