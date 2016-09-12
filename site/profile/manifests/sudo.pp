# requires saz-sudo from the forge
class profile::sudo::conf {

  include sudo

  profile::sudo::conf { 'systems':
    content => "%systems ALL=(ALL) NOPASSWD: ALL",
  }
}
