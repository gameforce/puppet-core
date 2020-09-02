class profile::mediastack {
  include 'docker'

  docker_compose { 'mediastack':
    ensure        => present,
    compose_files => ['/tmp/mediastack.yaml'],
    up_args       => '--remove-orphans',
  }

  file { '/tmp/mediastack.yaml':
    ensure => file,
    source => 'puppet:///modules/profile/docker/mediastack.yaml',
  }
}
