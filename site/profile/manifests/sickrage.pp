class profile::sickrage {
  include 'docker'

  docker_compose { '/tmp/docker-compose-sickrage-host.yml':
    ensure      => present,
    options     => '--project-name sickrage',
  }

  file { '/tmp/docker-compose-sickrage-host.yml':
    ensure      => file,
    source      => 'puppet:///files/docker/docker-compose-sickrage-host.yml',
  }
}
