# requires saz-sudo from the forge
  class profile::sudo {

  sudo::conf { 'systems':
  priority => 10,
  source => 'puppet:///files/etc/sudoers.d/systems.conf',

  }
}
