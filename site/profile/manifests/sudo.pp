# requires saz-sudo from the forge
class profile::sudo {
  include sudo
  include sudo::conf

  profile::sudo::conf { 'systems':
    content => "%systems ALL=(ALL) NOPASSWD: ALL",
  }
}
