class role::cloud {
  include profile::base
  include profile::packages
  include profile::sudo
  include profile::nginx
}
