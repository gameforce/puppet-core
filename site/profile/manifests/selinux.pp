class profile::selinux {

  class { 'selinux':
    mode => 'disable'
  }
}
