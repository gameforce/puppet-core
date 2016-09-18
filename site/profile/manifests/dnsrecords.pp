class profile::dnsrecords {

  resource_record { 'kam.gameforce.net delegation':
    record        => 'kam.gameforce.net',
    type          => 'NS',
    zone          => 'gameforce.net',
    query_section => 'authority',
    data          => 'kam.gameforce.net.',
    ttl           => '86400',
    keyfile       => '/etc/named/keys/update',
}

  resource_record { 'kam.gameforce.net servers':
    record        => 'kam.gameforce.net',
    type          => 'NS',
    data          => 'kam.gameforce.net.',
    ttl           => '86400',
    keyfile => '/etc/named/keys/update',
}

  resource_record { 'gameforc e.net mail exchangers':
    record        => 'gameforce.net',
    type          => 'MX',
    data          => '10 mxr.gameforce.net.',
    ttl           => '86400',
    keyfile       => '/etc/named/keys/update',
}

  resource_record { 'kam.gameforce.net address':
    ensure        => present,
    record        => 'kam.gameforce.net',
    type          => 'A',
    data          => [ '192.168.11.10' ],
    ttl           => '86400',
    keyfile       => '/etc/named/keys/update',
  }

  resource_record { 'mxr.gameforce.net address':
    ensure        => present,
    record        => 'mxr.gameforce.net',
    type          => 'CNAME',
    data          => [ 'kam.gameforce.net.' ],
    ttl           => '86400',
    keyfile       => '/etc/named/keys/update',
  }
}
