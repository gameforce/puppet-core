class profile::dnszones {

bind::zone { 'gameforce.net-internal':
  zone_type       => 'master',
  domain          => 'gameforce.net',
  allow_updates   => [ 'key update', ],
  ns_notify       => true,
  dnssec          => true,
  }

}
