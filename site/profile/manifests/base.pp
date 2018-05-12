class profile::base {

  # includes
  include ::openvmtools

  class sysctl {
    # Disable all interfaces
    sysctl { 'net.ipv6.conf.all.disable_ipv6':
      value => '1' }
  }

  class profile::motd {
    include motd
  }

  class { 'ntp':
    servers => [ 'clock.gameforce.net', 'sith.gameforce.net' ],
  }

  class { 'firewall':
    ensure => 'stopped'
  }

  service { "iptables":
    ensure => "stopped",
    hasstatus => "true",
    status => "true"
}

  class { 'sudo': }
    sudo::conf { 'systems':
      source      => 'puppet:///files/sudo/systems.conf',
      ldap_enable => true,
  }
}
