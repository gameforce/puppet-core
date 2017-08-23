class motd::params {
  case $::osfamily {
    'AIX': {
      $config_file = '/etc/motd'
      $template = 'motd/motd.erb'
      $mode = '0644'
      $owner = 'root'
      $group = 'bin'
    }
    /RedHat|Debian|Suse|Gentoo/: {
      $config_file = '/etc/motd'
      $template = 'motd/motd.erb'
      $mode = '0644'
      $owner = 'root'
      $group = 'root'
    }
    default: {
      case $::operatingsystem {
        'AIX': {
          $config_file = '/etc/motd'
          $template = 'motd/motd.erb'
          $mode = '0644'
          $owner = 'root'
          $group = 'bin'
        }
        'Gentoo': {
          $config_file = '/etc/motd'
          $template = 'motd/motd.erb'
          $mode = '0644'
          $owner = 'root'
          $group = 'root'
        }
        default: {
          fail("The ${module_name} module is not supported on ${::osfamily}/${::operatingsystem}.")
        }
      }
    }
  }
}
