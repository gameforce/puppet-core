class role::linux {
  include profile::sysctl
  include profile::package
  include profile::user
  include profile::motd
  include profile::sudo
  include profile::ntp
  include profile::firewall
#  include profile::logperm
}
