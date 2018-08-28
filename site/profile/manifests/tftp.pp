class profile::tftp {

  # Ensure tftp server is installed
  package { 'tftp-server':       ensure => 'installed', }
  package { 'syslinux-tftpboot': ensure => 'installed', }

  # create directory structure
  file { '/var/lib/tftpboot/pxelinux.cfg':
    ensure => 'directory',
  }

  # pxe default menu
  file { '/var/lib/tftpboot/pxelinux.cfg/default':
    ensure => 'present',
    source => 'puppet:///modules/profile/boot/default',
    require => File['/var/lib/tftpboot/pxelinux.cfg'],
  }

  # ipxe files
  file { '/var/lib/tftpboot/boot.ipxe':
    ensure => 'present',
    source => 'puppet:///modules/profile/boot/boot.ipxe',
  }

  file { '/var/lib/tftpboot/undionly.kpxe':
    ensure => 'present',
    source => 'puppet:///modules/profile/boot/undionly.kpxe',
  }
}
