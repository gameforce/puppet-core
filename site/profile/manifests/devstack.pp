class profile::devstack {
  include 'docker'

  docker_compose { 'devstack':
    ensure        => present,
    compose_files => ['/tmp/devstack.yaml'],
    up_args       => '--remove-orphans',
  }

  file { '/tmp/devstack.yaml':
    ensure => file,
    source => 'puppet:///modules/profile/docker/devstack.yaml',
  }
}
