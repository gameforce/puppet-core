class profile::dnszones {

  bind::zone { 'gameforce.net-forward':
    zone_type       => 'master',
    domain          => 'gameforce.net',
    allow_updates   => [ 'key update', ],
    ns_notify       => true,
    dnssec          => false,
  }

  bind::zone { 'gameforce.net-reverse':
    zone_type       => 'master',
    domain          => '11.168.192.in-addr.arpa',
    allow_updates   => [ 'key update', ],
    ns_notify       => true,
    dnssec          => false,
    }

    bind::view { 'internal':
    recursion          => true,
    match_destinations => [ 'any', ],
    zones              => [ 'gameforce.net-forward', 'gameforce.net-reverse', ],
  }
}
