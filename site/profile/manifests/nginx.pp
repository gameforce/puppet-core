class profile::nginx {
  class { 'nginx': }

  nginx::resource::server { 'cloud.gameforce.net':
    listen_port => 80,
    proxy       => 'http://rey.gameforce.net:8081/home/',
  }
}
