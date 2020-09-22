# storage role
class role::storage {
  include profile::samba::server
  include profile::nfs::server
}
