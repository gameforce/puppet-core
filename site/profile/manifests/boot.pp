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

# boot directory for unattended installs
  file { '/var/www/html/vhosts/kam/boot':
    ensure => 'directory',
  }

# ignition
  file { '/var/www/html/vhosts/kam/boot/ignition.json':
    ensure => 'present',
    source => 'puppet:///modules/profile/boot/ignition.json',
    notify =>  Service['httpd'],
  }

  # kickstart
  file { '/var/www/html/vhosts/kam/boot/centos.ks':
    ensure => 'present',
    source => 'puppet:///modules/profile/boot/centos.ks',
    notify =>  Service['httpd'],
  }
}
