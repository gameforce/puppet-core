class profile::selinux {
include selinux

  class { 'selinux':
    mode => 'permissive'
  }
}
