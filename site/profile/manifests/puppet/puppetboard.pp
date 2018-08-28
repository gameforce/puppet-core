class  profile::puppet::puppetboard {
  class { 'puppetboard':
    manage_virtualenv => true,
  }
}
