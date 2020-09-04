class profile::docker_compose {

  # ensure our compose file exists
  file { '/tmp/gameforce.yaml':
    ensure => file,
    source => 'puppet:///modules/profile/docker_compose/gameforce.yaml',
  }

  # start docker-compose
  include 'docker'
  docker_compose { 'gameforce':
    ensure        => present,
    compose_files => ['/tmp/gameforce.yaml'],
    up_args       => '--remove-orphans',
  }
}
