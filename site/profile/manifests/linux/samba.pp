class profile::samba {

class {'samba::server':
    workgroup     => 'fusefx.studio',
    server_string => "fbc-puppet",
    interfaces    => "enp0s25 lo",
    security      => 'user'
  }

  samba::server::share {'git':
    comment              => 'git',
    path                 => '/srv/git',
    browsable            => true,
    writable             => true,
    create_mask          => 2755,
    directory_mask       => 2755,
    force_create_mask    => 2755,
    force_directory_mode => 2755,
    force_group          => 'puppet',
    force_user           => 'systems',
  }
}
