class role::base {
  include profile::motd
  include profile::package
  include profile::sudo::conf
  include profile::user
}
