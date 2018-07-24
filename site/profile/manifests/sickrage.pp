class profile::sickrage {
  include 'docker'
  Exec { environment => [ "COMPOSE_PROJECT_NAME=sickrage" ] }

  docker_compose { 'sickrage':
    ensure      => present,
    options     => '-p sickrage',
    name        => '/tmp/docker-compose-sickrage-host.yml',
  }

  file { '/tmp/docker-compose-sickrage-host.yml':
    ensure      => file,
    source      => 'puppet:///files/docker/docker-compose-sickrage-host.yml',
  }
}
