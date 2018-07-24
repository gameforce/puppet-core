class profile::sickrage {
  include 'docker'

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
