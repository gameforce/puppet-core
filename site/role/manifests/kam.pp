class role::kam {
  #All roles should include the common profile
  include profile::common
  include profile::puppet::puppetdb
  include profile::puppet::r10k
  include profile::puppet::webhook
  include profile::bind
  include profile::dhcp
  include profile::boot
  include profile::nfs::server
  include profile::samba::server
  include profile::apache::server
  include profile::apache::vhosts::kam
}
