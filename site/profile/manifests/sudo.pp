class profile::sudo {
  class { 'sudo': }
    sudo::conf { 'systems':
      source      => 'puppet:///modules/profile/sudo/systems.conf',
      ##ldap_enable => false,
  }
}
