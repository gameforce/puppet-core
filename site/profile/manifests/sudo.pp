# requires saz-sudo from the forge
  class profile::sudo {

  sudo::conf { 'systems':
  content => "%systems ALL=(ALL) NOPASSWD: ALL",
  }

  sudo::conf { 'secure_path':
  content => "/opt/puppetlabs/bin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin" 

  }

}
