# storage role
class role::storage {
  include profile::common
  include profile::samba::server
  include profile::nfs::server
}
