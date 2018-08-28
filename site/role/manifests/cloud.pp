class role::nginx {
  include profile::base
  include profile::packages
  include profile::accounts
  include profile::sudo
  include profile::nginx
}
