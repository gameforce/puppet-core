class role::vip {
  include profile::apache::apache
  include profile::apache::vhosts::vip
}
