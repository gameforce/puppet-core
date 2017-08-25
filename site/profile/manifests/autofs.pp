class profile::autofs {

 class { 'autofs':
      'net'  => {
        mountpoint  => '/net',
        file_source => 'puppet:///files/autofs/auto.net',
      }
    }
  }
}
