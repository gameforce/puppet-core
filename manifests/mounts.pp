class mounts {
  class { 'autofs':
    'mount_files' => {
      'home' => {
        mountpoint  => '/home',
        file_source => 'puppet:///files/autofs/auto.home',
      },
      'net'  => {
        mountpoint  => '/net',
        file_source => 'puppet:///files/autofs/auto.net',
      }
    }
  }
}
