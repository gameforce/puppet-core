class role::default {
  # Common classes to all nodes
  include profile::sudo
  include profile::packages
  include profile::cron
  #All roles should include the common profile
  include profile::common
  include profile::autofs
}
