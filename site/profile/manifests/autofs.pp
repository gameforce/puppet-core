# puppet-autofs module
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

# mounts
autofs::mount { 'nas':
  mount       => '/net',
  mapfile     => '/etc/auto.nas',
  options     => '--timeout=120'
  }

autofs::mapfile { 'nas':
  path     => '/etc/auto.nas',
  mappings => [
    { 'key' => 'data', 'options' => 'rw,soft,intr', 'fs' => '192.168.11.10:/share/data' }
    #{ 'key' => 'media', 'options' => 'rw,soft,intr', 'fs' => '192.168.11.10:/share/media' },
    #{ 'key' => 'home', 'options' => 'rw,soft,intr', 'fs' => '192.168.11.10:/share/home' },
  ]
  }
}
