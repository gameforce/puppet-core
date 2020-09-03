class profile::autofs {
  include autofs

# enable browse mode in autofs.conf
file { '/etc/autofs.conf':
  ensure => 'present',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  source => 'puppet:///modules/profile/autofs/autofs.conf',
  notify => Service['autofs'],
  }
}
