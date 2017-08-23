# == Class: openvmtools
#
# This class handles installing the Open Virtual Machine Tools.
#
# === Parameters:
#
# [*with_desktop*]
#   Whether or not to install the desktop/GUI support.
#   Default: false
#
# [*ensure*]
#   Ensure if present or absent.
#   Default: present
#
# [*autoupgrade*]
#   Upgrade package automatically, if there is a newer version.
#   Default: false
#
# [*package_name*]
#   Name of the package.
#   Only set this if your platform is not supported or you know what you are
#   doing.
#   Default: auto-set, platform specific
#
# [*desktop_package_name*]
#   Name of the desktop package.
#   Only set this if your platform is not supported or you know what you are
#   doing.
#   Default: auto-set, platform specific
#
# [*service_ensure*]
#   Ensure if service is running or stopped.
#   Default: running
#
# [*service_name*]
#   Name of openvmtools service.
#   Only set this if your platform is not supported or you know what you are
#   doing.
#   Default: auto-set, platform specific
#
# [*service_enable*]
#   Start service at boot.
#   Default: true
#
# [*service_hasstatus*]
#   Service has status command.
#   Only set this if your platform is not supported or you know what you are
#   doing.
#   Default: auto-set, platform specific
#
# [*service_pattern*]
#   Pattern to look for in the process table to determine if the daemon is
#   running.
#   Only set this if your platform is not supported or you know what you are
#   doing.
#   Default: vmtoolsd
#
# === Sample Usage:
#
#   class { 'openvmtools': }
#
# === Authors:
#
# Mike Arnold <mike@razorsedge.org>
#
# === Copyright:
#
# Copyright (C) 2015 Mike Arnold, unless otherwise noted.
#
class openvmtools (
  $with_desktop          = false,
  $ensure                = 'present',
  $autoupgrade           = false,
  $package_name          = $openvmtools::params::package_name,
  $desktop_package_name  = $openvmtools::params::desktop_package_name,
  $service_ensure        = 'running',
  $service_name          = $openvmtools::params::service_name,
  $service_enable        = true,
  $service_hasstatus     = $openvmtools::params::service_hasstatus,
  $service_pattern       = 'vmtoolsd',
) inherits openvmtools::params {

  $supported = $openvmtools::params::supported

  # Validate our booleans
  validate_bool($with_desktop)
  validate_bool($autoupgrade)
  validate_bool($service_enable)
  validate_bool($service_hasstatus)
  validate_bool($supported)

  case $ensure {
    /(present)/: {
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }

      if $service_ensure in [ running, stopped ] {
        $service_ensure_real = $service_ensure
      } else {
        fail('service_ensure parameter must be running or stopped')
      }
    }
    /(absent)/: {
      $package_ensure = 'absent'
      $service_ensure_real = 'stopped'
    }
    default: {
      fail('ensure parameter must be present or absent')
    }
  }

  case $::virtual {
    'vmware': {
      if $supported {
        package { $package_name :
          ensure => $package_ensure,
        }
        if $with_desktop {
          package { $desktop_package_name :
            ensure => $package_ensure,
          }
        }

        service { $service_name :
          ensure    => $service_ensure_real,
          enable    => $service_enable,
          hasstatus => $service_hasstatus,
          pattern   => $service_pattern,
          require   => Package[$package_name],
        }
      } else {
        notice "Your operating system ${::operatingsystem} is unsupported and will not have the Open Virtual Machine Tools installed."
      }
    }
    # If we are not on VMware, do not do anything.
    default: { }
  }
}
