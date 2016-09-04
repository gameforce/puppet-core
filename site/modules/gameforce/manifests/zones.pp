
gameforce::bind::server::file { 'gameforce.net':
  source => 'puppet:///modules/gameforce/dns/static.gameforce.net',
}

gameforce::bind::server::file { '11.168.192.in-addr.arpa':
  source => 'puppet:///modules/gameforce/dns/11.168.192.in-addr.arpa',
}

gameforce::bind::server::file { [ 'gameforce.net', '11.168.192.in-addr.arpa' ]:
  source_base => 'puppet:///modules/gameforce/dns/',
}
