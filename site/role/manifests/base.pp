class role::base {
  include profile::packages
  include profile::accounts
  include profile::autofs
  include profile::sudo
  include profile::firewall 
}
