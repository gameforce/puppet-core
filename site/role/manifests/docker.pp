class role::docker {
    include profile::base
  #  include profile::packages
    include profile::docker
    include profile::accounts
    include profile::sudo
  }
