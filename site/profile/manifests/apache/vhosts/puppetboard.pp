class profile::apache::vhosts::puppetboard {

  # vhost definition: puppetboard
  class { 'puppetboard::apache::vhost':
    vhost_name => 'puppetboard',
    port => 80,
  }
}
