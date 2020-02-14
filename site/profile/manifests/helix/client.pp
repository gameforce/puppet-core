class profile::helix::client {

  # install helix client (p4)
  class { 'helix::client':
    pkgname => 'helix-cli',
  }
}
