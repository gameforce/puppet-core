class profile::autofs {

# enable browse mode in autofs.conf
file { '/etc/autofs.conf':
  ensure => 'present',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => 'puppet:///modules/files/autofs/autofs.conf',
  notify => Service['autofs'],
}

class { 'autofs':
  mount_files => {
    home => {
      mountpoint  => '/home',
      file_source => 'puppet:///modules/files/autofs/auto.home',
      },
    net  => {
    mountpoint  => '/net',
    file_source => 'puppet:///modules/files/autofs/auto.net',
      }
    }
  }
}
