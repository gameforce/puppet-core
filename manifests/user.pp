class user {

  group { 'puppet':
    ensure => 'present',
    gid    => '52',
  }

  user { 'system':
    ensure           => 'present',
    home             => '/home/system',
    password         => '!!',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/zsh',
    uid              => '1000',
    comment          => 'systems',
    groups           => [ 'users','puppet' ]
  }

}
