class role::base {
  include profile::motd
  include profile::package
  include profile::selinux
  include profile::sysctl
  include profile::sudo
  include profile::user
}
