class role::kickstart {
  include profile::kickstart
  include profile::apache::apache
  include profile::apache::vhosts::kickstart
}
