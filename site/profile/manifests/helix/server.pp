class profile::helix::server {

  # install helix server (p4d)
  class { 'helix::server':
    pkgname => 'helix-p4d',
  }
}
