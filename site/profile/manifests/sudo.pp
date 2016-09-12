# requires saz-sudo from the forge
  class profile::sudo {

  sudo::conf { 'systems':
  priority => 10,
  source => 'puppet:///modules/profile/etc/sudoers.d/systems.conf',

  }
}
