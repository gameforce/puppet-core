class profile::plex {
  include 'docker'

  docker_compose { '/tmp/docker-compose-plex-host.yml':
    ensure      => present,
    options     => '--project-name plex',
    subscribe   => File['/tmp/docker-compose-plex-host.yml'],
  }

  file { '/tmp/docker-compose-plex-host.yml':
    ensure      => file,
    source      => 'puppet:///files/docker/docker-compose-plex-host.yml',
  }
}
