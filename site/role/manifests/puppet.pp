# puppetserver role
class role::puppet {
  #All roles should include the common profile
  include profile::common
  include profile::puppet::puppetdb
  include profile::puppet::r10k
  include profile::puppet::webhook
  #include profile::puppet::puppetboard
  ##include profile::bind
  ##include profile::dhcp
}
