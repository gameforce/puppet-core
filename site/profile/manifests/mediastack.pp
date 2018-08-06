class profile::mediastack {
  include 'docker'

  docker_compose { 'mediastack':
    ensure      => present,
    name        => '/tmp/mediastack.yml',
  }

  #file { '/plex':
  #  ensure      => directory,
  #}

  file { '/tmp/mediastack.yml':
    ensure      => file,
    source      => 'puppet:///files/docker/mediastack.yml',
  }
}
