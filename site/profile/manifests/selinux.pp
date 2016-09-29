class profile::selinux {

  class { 'selinux':
    mode => 'disabled'
  }
}
