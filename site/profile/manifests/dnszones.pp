class profile::dnszones {
#include bind
bind::zone { 'gameforce.net':
  zone_type       => 'master',
  domain          => 'gameforce.net',
  allow_updates   => [ 'key local-update', ],
  ns_notify       => true,
  dnssec          => true,
  }

}
