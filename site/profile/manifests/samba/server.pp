class profile::samba::server {

  class {'samba::server':
      workgroup     => 'gameforce',
      server_string => "Gameforce Samba Server",
      interfaces    => "eth0 lo",
      security      => 'user'
    }

  samba::server::share {'data':
    comment              => 'Data',
    path                 => '/data',
    browsable            => true,
    writable             => true,
    create_mask          => 774,
    directory_mask       => 774,
    force_group          => 'users',
    force_user           => 'darf',
    }
  }
