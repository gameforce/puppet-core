class role::kam {
  include profile::puppet
  include profile::boot
  include profile::repo
  include profile::apache::server
  include profile::apache::vhosts::kam
}
