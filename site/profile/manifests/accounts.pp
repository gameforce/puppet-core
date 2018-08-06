# requires vcsrepo from the forge
class profile::accounts {

  group { 'puppet':
    ensure => 'present',
    gid    => '52',
  }

  # create our default local user
  user { 'darf':
    ensure           => 'present',
    home             => '/home/darf',
    managehome       => true,
    password         => '$1$2zR7MTG3$yn3d4zfVfppe5ap1HnauH.',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/zsh',
    uid              => '1001',
    comment          => 'darf@gameforce.net',
    groups           => [ 'users','puppet','disk','sudo','docker' ]
  }

  ssh_authorized_key { "darf@obiwan":
    ensure  => present,
    user    => darf,
    type    => "ssh-rsa",
    key     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQClbJjehAJkP5n3CLY2OEKWgsXdSqd2p7WYtco0hvbxix0dX91rTHspffenahOaulvAIsbfZz5emyPffrWwpXVQKscDZbHapTwbMcc+igZ1VkXgaDvnz/PtcQEhcR9JMh/Bzk1/ySLUfA9Iz8xPXOcmgw50UjLIrcqIL5zgUagQ7ScvD/nN0DxPk93hjhzLWbxUzxsHgzY332y8PlmfliDsYbgof2vBccdlM20T5Mk7ivofICUCqSWJGkpFfJh/FniD+bEFB2uAyLjzml8p5pLDZxMYA86jSnzja0y7Dex1UXIeotX59xzfF/x+HmkGSW3IJIgw7K5PruhuO/YWQNUx";
 }


  # clone our dotfiles repo
  vcsrepo { '/home/darf/.dotfiles':
    ensure   => 'latest',
    provider => 'git',
    owner    => 'darf',
    group    => 'users',
    source   => 'https://github.com/gameforce/dotfiles.git',
    revision => 'master',
  }

  # Setup symlinks to dotfiles
  file { '/home/darf/.zshrc':
    ensure => 'symlink',
    target => '/home/darf/.dotfiles/zshrc.linux',
  }

  file { '/home/darf/.vimrc':
    ensure => 'symlink',
    target => '/home/darf/.dotfiles/vimrc',
  }

  file { '/home/darf/.vim':
    ensure => 'symlink',
    target => '/home/darf/.dotfiles/vim/',
  }

  file { '/home/darf/.gitconfig':
    ensure => 'symlink',
    target => '/home/darf/.dotfiles/gitconfig',
  }

  file { '/home/darf/.screenrc':
    ensure => 'symlink',
    target => '/home/darf/.dotfiles/screenrc',
  }
}
