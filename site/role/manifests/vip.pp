class role::vip {
  include profile::apache::server
  include profile::apache::vhosts::vip
}
