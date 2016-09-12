class role::base {
  include profile::motd
  include profile::package
  include profile::sudo
  include profile::user
}
