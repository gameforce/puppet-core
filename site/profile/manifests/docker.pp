class profile::docker {
  include 'docker'

  # ensure docker-compose is present
  class {'docker::compose':
    ensure => present,
    version => '1.9.0',
  }
}
