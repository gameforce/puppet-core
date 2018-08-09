class role::kickstart {
  include profile::kickstart
  include profile::apache::server
  include profile::apache::vhosts::kickstart
}
