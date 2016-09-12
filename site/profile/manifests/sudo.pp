# requires saz-sudo from the forge
  class profile::sudo { 'systems':
  content => "%systems ALL=(ALL) NOPASSWD: ALL",
}
