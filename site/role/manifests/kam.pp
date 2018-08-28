class role::kam {
  #All roles should include the common profile
  include profile::puppet::puppetdb
  include profile::puppet::r10k
  include profile::puppet::webhook
  include profile::puppet::puppetboard
  include profile::bind
  include profile::dhcp
  include profile::tftp
  include profile::apache
  include profile::boot
  include profile::nfs::server
  include profile::samba::server
}
