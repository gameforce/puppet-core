class profile::sysctl {
  # Disable all interfaces
  sysctl { 'net.ipv6.conf.all.disable_ipv6':
    value => '1' }
}
