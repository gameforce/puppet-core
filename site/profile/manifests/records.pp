class profile::bind::records {

  resource_record { 'kam.gameforce.net address':
    ensure  => present,
    record  => 'kam.gameforce.net',
    type    => 'A',
    data    => [ '192.168.11.10' ],
    ttl     => 86400,
    zone    => 'gameforce.net',
    server  => 'kam.gameforce.net',
    keyname => 'local-update',
    keyfile => '/etc/rndc.key'
  }
  
}
