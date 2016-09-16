class profile::selinux {

  class { 'selinux':
    mode => 'permissive'
  }
}
