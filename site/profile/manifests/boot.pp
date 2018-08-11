class profile::boot {

# Ensure tftp server is installed
  package { 'tftp-server':       ensure => 'installed', }
  package { 'syslinux-tftpboot': ensure => 'installed', }

  file { '/var/lib/tftpboot/pxelinux.cfg':
    ensure => 'directory',
  }

# pxe default menu
  file { '/var/lib/tftpboot/pxelinux.cfg/default':
    ensure => 'present',
    source => 'puppet:///modules/profile/boot/default',
    require => File['/var/lib/tftpboot/pxelinux.cfg'],
    # notify =>  Service['tftp'],
    # Server Error: Invalid relationship: File[/var/lib/tftpboot/pxelinux.cfg/default] { notify => Service[tftp.service] }, because Service[tftp.service] doesn't seem to be in the catalog
  }

  # place our ipxe config files in the web root
  file { '/var/www/html/vhosts/kam/boot.ipxe':
    ensure => 'present',
    source => 'puppet:///modules/profile/boot/boot.ipxe',
    notify =>  Service['httpd'],
  }

  file { '/var/www/html/vhosts/kam/boot.ipxe.cfg':
    ensure => 'present',
    source => 'puppet:///modules/profile/boot/boot.ipxe.cfg',
    notify =>  Service['httpd'],
  }

  file { '/var/www/html/vhosts/kam/menu.ipxe':
    ensure => 'present',
    source => 'puppet:///modules/profile/boot/menu.ipxe',
    notify =>  Service['httpd'],
  }

  # boot directory for unattended installs links to /net/systems/boot
  file { '/var/www/html/vhosts/kam/boot':
    ensure => 'symlink',
    target => '/net/systems/boot',
  }

  # ignition
  file { '/var/www/html/vhosts/kam/ignition.json':
    ensure => 'present',
    source => 'puppet:///modules/profile/boot/ignition.json',
    notify =>  Service['httpd'],
  }

  # kickstart
  file { '/var/www/html/vhosts/kam/centos.ks':
    ensure => 'present',
    source => 'puppet:///modules/profile/boot/centos.ks',
    notify =>  Service['httpd'],
  }
}
