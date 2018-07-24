class profile::plex {
  include 'docker'

  docker_compose { '/tmp/docker-compose-plex-host.yml':
    ensure  => present,
    docker_file => '/tmp/docker-compose-plex-host.yml'
    subscribe => File['/tmp/docker-compose-plex-host.yml'],
  }

  file { '/tmp/docker-compose-plex-host.yml':
    ensure => file,
    source => 'puppet:///modules/files/docker/docker-compose-plex-host.yml',
  }
}
