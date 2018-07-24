class profile::sickrage {
  include 'docker'

  docker_compose { 'sickrage':
    ensure      => present,
    name        => '/sickrage/docker-compose-sickrage.yml',
  }

  file { '/sickrage':
    ensure      => directory,
  }

  file { '/sickrage/docker-compose-sickrage.yml':
    ensure      => file,
    source      => 'puppet:///files/docker/docker-compose-sickrage.yml',
  }
}
