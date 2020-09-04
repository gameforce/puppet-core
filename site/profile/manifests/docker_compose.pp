class profile::docker_compose {

  # ensure our compose file exists
  file { '/tmp/docker-compose.yaml':
    ensure => file,
    source => 'puppet:///modules/profile/docker_compose/docker-compose.yaml',
  }

  # start docker-compose
  include 'docker'
  docker_compose { 'docker-compose':
    ensure        => present,
    compose_files => ['/tmp/docker-compose.yaml'],
    up_args       => '--remove-orphans',
  }
}
