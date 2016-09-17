class role::dns {
  include role::base
  include profile::dns::dns_server
  include profile::dns::dns_zones
  include profile::dns::dns_records
}
