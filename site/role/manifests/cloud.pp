class role::cloud {
  include profile::common
  include profile::packages
  include profile::sudo
  include profile::nginx
}
