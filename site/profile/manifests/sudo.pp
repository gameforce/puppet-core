# requires saz-sudo from the forge
  class profile::sudo::conf { 'systems':

    include sudo

    content => "%systems ALL=(ALL) NOPASSWD: ALL",
  }
}
