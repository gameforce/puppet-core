class profile::windows {

  # includes
  include ::openvmtools

  windowsfeature { 'TelnetClient':
  ensure => present,
  }
}
