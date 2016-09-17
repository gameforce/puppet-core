class role::dns {
  include role::base
  include profile::dnsserver
  include profile::dnszones
  #include profile::dnsrecords
}
