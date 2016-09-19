class role::puppet {
  include role::base
  include profile::r10k
  include profile::puppetdb
}
