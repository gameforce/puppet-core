class common {
  
  # includes
  include ::openvmtools

  # classes
  class { 'ntp':
    servers => [ 'clock.gameforce.net', 'sith.gameforce.net' ],
  }
}
