class profile::common {

  # Config common to all nodes

  # standard includes
  include epel

  # common users
  accounts::user { 'darf':
    uid      => '1001',
    gid      => '100',
    group    => 'users',
    shell    => '/bin/zsh',
    password => '$1$yXAObsJr$RjHlgtKcFrOur4e2tq3HX/',
    sshkeys => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQClbJjehAJkP5n3CLY2OEKWgsXdSqd2p7WYtco0hvbxix0dX91rTHspffenahOaulvAIsbfZz5emyPffrWwpXVQKscDZbHapTwbMcc+igZ1VkXgaDvnz/PtcQEhcR9JMh/Bzk1/ySLUfA9Iz8xPXOcmgw50UjLIrcqIL5zgUagQ7ScvD/nN0DxPk93hjhzLWbxUzxsHgzY332y8PlmfliDsYbgof2vBccdlM20T5Mk7ivofICUCqSWJGkpFfJh/FniD+bEFB2uAyLjzml8p5pLDZxMYA86jSnzja0y7Dex1UXIeotX59xzfF/x+HmkGSW3IJIgw7K5PruhuO/YWQNUx',
      ],
    locked   => false,
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

  accounts::user { 'root':
    password => '$1$yXAObsJr$RjHlgtKcFrOur4e2tq3HX/',
    sshkeys => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDstox0gov/Ecnbc9i6IpwN5nUwwmiZvDvU+9RVTMLODC/LA5kbwjyKf8UXeQHdg2pvDE6bilaR4vUh+rSFZgUVIyOp92eDpDqQvkcXy4+S7Qjnxc9ONZotB9SR4+ghK2hYRGr333WOjJ/VWrXg5sQfugZ+YFMSQpA+pps4BMXh8SPfvFaVYd/GnvRR3/Uo2UC09OLw2y/toRL8Cj0GU6LqRZqo+Sv5Y/tk3bvaK9Pilt41iPZ6sUekuhQqM262yJi3lfPfaBVx0otO20nDteiwUKucPaP7axqWNy/FHarU9NrnxkuzMBaT8dso9nVweTQDUruIbuMkDmbhZ62hX+Xj root@rey',
      ],
    locked   => false,
  }

    # sshd config
    include profile::ssh::server
    include profile::ssh::client

    exec {'shosts.equiv':
      command => '/bin/cat /etc/ssh/ssh_known_hosts | /bin/grep -v "^#" | /bin/awk \'{print $1}\' | /bin/sed -e \'s/,/\n/g\' > /etc/ssh/shosts.equiv',
      require => Class['ssh::knownhosts'],
  }

    # disable firewall
    class { 'firewall':
      ensure => 'stopped',
    }

    # common packages needed everywhere
    package {[
            'vim',
            'sudo',
            'screen',
            'zsh'
        ]:
        ensure => present,
    }

    # site specific environment
    $sitepath = '/net/systems/bin:/opt/puppetlabs/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin'
    file { '/etc/profile.d/site.sh':
      content => "export PATH=${sitepath}\n",
      mode    => '0644'
    }

    # set locale
    class { 'locales':
        default_locale => 'en_US.UTF-8',
        locales        => ['en_US.UTF-8 UTF-8'],
    }
}
