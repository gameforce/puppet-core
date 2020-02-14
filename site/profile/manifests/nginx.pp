class profile::nginx {
  class { 'nginx': }

  # sickrage proxy
  nginx::resource::server { 'sickrage.gameforce.net':
    listen_port => 8081,
    proxy       => 'http://rey:8081/home/',
  }

  # transmission proxy
  nginx::resource::server { 'transmission.gameforce.net':
    listen_port => 9091,
    proxy       => 'http://rey:9091/transmission/web',
  }

  # webhook proxy
  nginx::resource::server { 'webhook.gameforce.net':
    listen_port => 8088,
    proxy       => 'http://sidious:8088/',
  }
}
