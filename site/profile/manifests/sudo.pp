class profile::sudo {
  class { 'sudo': }
    sudo::conf { 'systems':
      source      => 'puppet:///files/sudo/systems.conf',
      ldap_enable => false,
  }
}
