# Linux default role
class role::default {
  include profile::firewall
  include profile::autofs
  include profile::ssh
  include profile::users
  include profile::sudo
  include profile::packages
  include profile::cron
}
