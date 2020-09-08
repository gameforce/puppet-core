class role::default {
  #All roles should include the common profile
  include profile::common
  include profile::autofs
  include profile::ssh
  include profile::users
  include profile::sudo
  include profile::packages
  include profile::cron
}
