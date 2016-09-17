class role::dns {
  include role::base
  include profile::dns_server
  include profile::dns_zones
  include profile::dns_records
}
