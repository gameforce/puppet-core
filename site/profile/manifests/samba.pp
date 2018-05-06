class profile::samba {
    
  class {'samba::server':
      workgroup     => 'gameforce',
      server_string => "Gameforce Samba Server",
      interfaces    => "eth0 lo",
      security      => 'share'
    }

  samba::server::share {'data':
    comment              => 'Data',
    path                 => '/data',
    browsable            => true,
    writable             => true,
    create_mask          => 0770,
    directory_mask       => 0770,
    force_group          => 'darf',
    force_user           => 'darf',
    }
  }
