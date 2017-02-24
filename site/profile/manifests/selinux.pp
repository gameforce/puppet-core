# This is disabled since we're disabling selinux from the kickstart install
class profile::selinux {

  class { 'selinux':
    mode => 'disabled'
  }
}
