class role::macos {
  include profile::macos::package
  include profile::macos::user
  #include profile::sudo
  #include profile::logperm
}
