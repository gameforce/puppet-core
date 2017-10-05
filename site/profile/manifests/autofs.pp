class profile::autofs {
  # enable browse mode in autofs.conf
  file_line { 'browse_mode':
  path  => '/etc/autofs.conf',
  line  => 'browse_mode = "yes"',
  match => '^browse_mode*',
}

file { '/etc/autofs.conf':
  ensure   => 'present',
  owner    => 'root',
  group    => 'root',
  mode     => '0644',
  source => 'puppet:///files/autofs/auto.conf.erb',
}

class { 'autofs':
  mount_files => {
    home => {
      mountpoint  => '/home',
      file_source => 'puppet:///files/autofs/auto.home',
      },
    net  => {
    mountpoint  => '/net',
    file_source => 'puppet:///files/autofs/auto.net',
      }
    }
  }
}
