# requires vcsrepo from the forge
class profile::macos::user {

  group { 'puppet':
    ensure => 'present',
    gid    => '52',
  }

  # create our default user
  user { 'systems':
    ensure           => 'present',
    home             => '/Users/systems',
    managehome       => 'false',
    password         => 'cabba2fbdbfc455bc0bfff1b94e55ffb4cadbbc276026932984176b2786bac2b97b39bcb5d22ede61ef465f163ca7c8c9c84f5c309fcdf488f25907288b296f28a39e42ba51782724174438330ead79c803e85abac7451bdf2c2609ab7c3ecd0a4338a8d5b934fd43b0944ce0f49a28c1676f43649e5d5edb95bce293e488734',
    salt             => 'f5460e4643ab1b7178247b528e68aef297378bdb1f02c9b44045f7a905547552',
    iterations       => '40000',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/zsh',
    uid              => '502',
    comment          => 'systems',
    groups           => [ 'staff','puppet' ]
  }

  # clone our dotfiles repo
  vcsrepo { '/Users/systems/.dotfiles':
    ensure => 'latest',
    provider => 'git',
    owner => 'systems',
    group => 'puppet',
    source => 'https://github.com/gameforce/dotfiles.git',
    revision => 'master',
  }

  # Setup symlinks to dotfiles
  file { '/Users/systems/.zshrc':
    ensure => 'symlink',
    target => '/Users/systems/.dotfiles/zshrc.osx',
  }

  file { '/Users/systems/.vimrc':
    ensure => 'symlink',
    target => '/Users/systems/.dotfiles/vimrc',
  }

  file { '/Users/systems/.vim':
    ensure => 'symlink',
    target => '/Users/systems/.dotfiles/vim',
  }

  file { '/Users/systems/.gitconfig':
    ensure => 'symlink',
    target => '/Users/systems/.dotfiles/gitconfig',
  }

  file { '/Users/systems/.screenrc':
    ensure => 'symlink',
    target => '/Users/systems/.dotfiles/screenrc',
  }
}
