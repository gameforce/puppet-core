  class profile::users {
  #common users

  # Add sudo group
    group { 'resource title':
      name                 => 'sudo',
      ensure               => 'present',
      gid                  => '1010'
    }

  accounts::user { 'darf':
    uid      => '1011',
    gid      => '1011',
    groups   => [
    'users',
    'sudo',
  ],
    shell    => '/bin/zsh',
    password => '$1$yXAObsJr$RjHlgtKcFrOur4e2tq3HX/',
    sshkeys  => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDD9lGQHLLhjD6lR+hRn7cMxcsie3JInL7uU40Q3nkJQwT5SpUSOIJQwg4M//ROiQRo0LfSXPRb89sN0ubtOsJpf5PLyYgbDyO/7o0I0FmkJV2hx/NfSs7UC/ZMPx24l4jXEMOM+tKulTQP3CRf/890IliTAKORISPJXZIgDHu3e/6A2p3TSAQhYnova/30OP0VfPD+g1kMP57ec9R3nnWBzE/S8yPpplGuJxgasrnx9rTqamFVsulVxSl4glKUEIoFA1YhWQbzC7cpikWM8Ad79vAqYj246UbCNnOuRDW9XxtVYRDqKJk8hCPxklLZIE9XtnngKc1FRScMhznfHYeF darf@gameforce.net',
      ],
    locked   => false,
  }

  accounts::user { 'root':
    password => '$1$yXAObsJr$RjHlgtKcFrOur4e2tq3HX/',
    sshkeys  => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDstox0gov/Ecnbc9i6IpwN5nUwwmiZvDvU+9RVTMLODC/LA5kbwjyKf8UXeQHdg2pvDE6bilaR4vUh+rSFZgUVIyOp92eDpDqQvkcXy4+S7Qjnxc9ONZotB9SR4+ghK2hYRGr333WOjJ/VWrXg5sQfugZ+YFMSQpA+pps4BMXh8SPfvFaVYd/GnvRR3/Uo2UC09OLw2y/toRL8Cj0GU6LqRZqo+Sv5Y/tk3bvaK9Pilt41iPZ6sUekuhQqM262yJi3lfPfaBVx0otO20nDteiwUKucPaP7axqWNy/FHarU9NrnxkuzMBaT8dso9nVweTQDUruIbuMkDmbhZ62hX+Xj root@rey== darf@gameforce.net',
      ],
    locked   => false,
  }

  # clone our dotfiles repo
  vcsrepo { "/home/darf/.dotfiles":
    ensure   => 'latest',
    provider => 'git',
    owner    => 'darf',
    group    => 'users',
    source   => 'https://github.com/gameforce/dotfiles.git',
    revision => 'master',
  }
}
