class profile::transmission {
    include 'docker'

    docker_compose { 'transmission':
      ensure      => present,
      name        => '/transmission/docker-compose-transmission.yml',
    }

    # required to have a project name #745
    file { '/transmission':
      ensure      => directory,
    }

    file { '/transmission/docker-compose-transmission.yml':
      ensure      => file,
      source      => 'puppet:///files/docker/docker-compose-transmission.yml',
    }
}
