# == Class: openvmtools::params
#
# This class handles OS-specific configuration of the openvmtools module.  It
# looks for variables in top scope (probably from an ENC such as Dashboard).  If
# the variable doesn't exist in top scope, it falls back to a hard coded default
# value.
#
# === Authors:
#
# Mike Arnold <mike@razorsedge.org>
#
# === Copyright:
#
# Copyright (C) 2015 Mike Arnold, unless otherwise noted.
#
class openvmtools::params {
  if $::operatingsystemmajrelease { # facter 1.7+
    $majdistrelease = $::operatingsystemmajrelease
  } elsif $::lsbmajdistrelease {    # requires LSB to already be installed
    $majdistrelease = $::lsbmajdistrelease
  } elsif $::os_maj_version {       # requires stahnma/epel
    $majdistrelease = $::os_maj_version
  } else {
    $majdistrelease = regsubst($::operatingsystemrelease,'^(\d+)\.(\d+)','\1')
  }

  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        'RedHat', 'CentOS', 'OEL', 'OracleLinux', 'Scientific': {
          $package_name = 'open-vm-tools'
          $desktop_package_name = 'open-vm-tools-desktop'
          $service_name = 'vmtoolsd'
          $service_hasstatus = true
          case $majdistrelease {
            '3','4','5','6': {
              $supported = false
            }
            default: {
              $supported = true
            }
          }
        }
        'Fedora': {
          $package_name = 'open-vm-tools'
          $desktop_package_name = 'open-vm-tools-desktop'
          $service_name = 'vmtoolsd'
          $service_hasstatus = true
          case $majdistrelease {
            '1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18': {
              $supported = false
            }
            default: {
              $supported = true
            }
          }
        }
        default: {
          $supported = false
        }
      }
    }
    'Suse': {
      case $::operatingsystem {
        'SLES', 'SLED': {
          $package_name = 'open-vm-tools'
          $desktop_package_name = 'open-vm-tools-desktop'
          $service_name = 'vmtoolsd'
          $service_hasstatus = true
          case $majdistrelease {
            '9','10','11': {
              $supported = false
            }
            default: {
              $supported = true
            }
          }
        }
        'OpenSUSE': {
          $package_name = 'open-vm-tools'
          $desktop_package_name = 'open-vm-tools-desktop'
          $service_name = 'vmtoolsd'
          $service_hasstatus = true
          case $majdistrelease {
            '9','10': {
              $supported = false
            }
            default: {
              $supported = true
            }
          }
        }
        default: {
          $supported = false
        }
      }
    }
    'Debian': {
      case $::operatingsystem {
        'Debian': {
          $package_name = 'open-vm-tools'
          $desktop_package_name = 'open-vm-toolbox'
          $service_name = 'open-vm-tools'
          $service_hasstatus = false
          case $majdistrelease {
            '5','6': {
              $supported = false
            }
            default: {
              $supported = true
            }
          }
        }
        'Ubuntu': {
          $package_name = 'open-vm-tools'
          $desktop_package_name = 'open-vm-toolbox'
          $service_name = 'open-vm-tools'
          $service_hasstatus = false
          case $::operatingsystemrelease {
            '10.04','10.10','11.04','11.10': {
              $supported = false
            }
            default: {
              $supported = true
            }
          }
        }
        default: {
          $supported = false
        }
      }
    }
    default: {
      $supported = false
      $package_name = nil
      $desktop_package_name = nil
      $service_name = nil
      $service_hasstatus = false
    }
  }
}
