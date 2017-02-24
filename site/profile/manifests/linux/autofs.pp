class profile::autofs {
  class { 'autofs':
    case $::osfamily {
      'redhat': {
        'mount_files' => {
        'net' => {
          mountpoint  => '/net',
          file_source => 'puppet:///files/autofs/auto.net',
        }
      }
    }
      'darwin': {
        'mount_files' => {
        'volumes' => {
          mountpoint  => '/Volumes',
          file_source => 'puppet:///files/autofs/auto_volumes',
        }
      } 
    }
      default: {
        'mount_files' => {
        'net' => {
          mountpoint  => '/net',
          file_source => 'puppet:///files/autofs/auto.net',
          }
        }
      }
    }
  }
}
