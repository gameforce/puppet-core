class user {

  group { 'puppet':
    ensure => 'present',
    gid    => '52',
  }

  user { 'darf':
    ensure           => 'present',
    home             => '/home/darf',
    password         => '!!',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/zsh',
    uid              => '1000',
    comment          => 'darf',
    groups           => [ 'users','puppet' ]
  }

}
