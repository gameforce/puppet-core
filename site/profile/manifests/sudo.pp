# requires saz-sudo from the forge
  class profile::sudo {

  sudo::conf { 'systems':
  content => "%systems ALL=(ALL) NOPASSWD: ALL",
  }
  
}
