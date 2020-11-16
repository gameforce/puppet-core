# cloud instance
class role::cloud {
  include profile::sudo
  include profile::nginx
}
