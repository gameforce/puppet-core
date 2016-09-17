class profile::dnszones {

bind::zone { 'gameforce.net-internal':
  zone_type       => 'master',
  dynamic         => 'false',
  domain          => 'gameforce.net',
  allow_updates   => [ 'key local-update', ],
  ns_notify       => true,
  dnssec          => true,
  }

}
