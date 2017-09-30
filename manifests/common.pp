class common {

  # includes
  include ::openvmtools
  include ::autofs

  # classes
  class { 'ntp':
    servers => [ 'clock.gameforce.net', 'sith.gameforce.net' ],
  }

  class { 'firewall':
    ensure => 'stopped'
  }
}
