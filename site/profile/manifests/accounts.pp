# requires vcsrepo from the forge
class profile::accounts {

  group { 'puppet':
    ensure => 'present',
    gid    => '52',
  }

  # create our default local user
  user { 'systems':
    ensure           => 'present',
    home             => '/home/systems',
    managehome       => true,
    password         => '$1$GameForc$5aLg3YmOPfKApjeLWr./5/',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/zsh',
    uid              => '502',
    comment          => 'systems',
    groups           => [ 'users','puppet' ]
  }

  ssh_authorized_key { "darf@obiwan":
    ensure  => present,
    user    => root,
    type    => "ssh-rsa",
    key     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQClbJjehAJkP5n3CLY2OEKWgsXdSqd2p7WYtco0hvbxix0dX91rTHspffenahOaulvAIsbfZz5emyPffrWwpXVQKscDZbHapTwbMcc+igZ1VkXgaDvnz/PtcQEhcR9JMh/Bzk1/ySLUfA9Iz8xPXOcmgw50UjLIrcqIL5zgUagQ7ScvD/nN0DxPk93hjhzLWbxUzxsHgzY332y8PlmfliDsYbgof2vBccdlM20T5Mk7ivofICUCqSWJGkpFfJh/FniD+bEFB2uAyLjzml8p5pLDZxMYA86jSnzja0y7Dex1UXIeotX59xzfF/x+HmkGSW3IJIgw7K5PruhuO/YWQNUx";
 }


  # clone our dotfiles repo
  vcsrepo { '/home/systems/.dotfiles':
    ensure   => 'latest',
    provider => 'git',
    owner    => 'systems',
    group    => 'systems',
    source   => 'https://github.com/gameforce/dotfiles.git',
    revision => 'master',
  }

  # Setup symlinks to dotfiles
  file { '/home/systems/.zshrc':
    ensure => 'symlink',
    target => '/home/systems/.dotfiles/zshrc.linux',
  }

  file { '/home/systems/.vimrc':
    ensure => 'symlink',
    target => '/home/systems/.dotfiles/vimrc',
  }

  file { '/home/systems/.vim':
    ensure => 'symlink',
    target => '/home/systems/.dotfiles/vim',
  }

  file { '/home/systems/.gitconfig':
    ensure => 'symlink',
    target => '/home/systems/.dotfiles/gitconfig',
  }

  file { '/home/systems/.screenrc':
    ensure => 'symlink',
    target => '/home/systems/.dotfiles/screenrc',
  }
}
