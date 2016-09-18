class profile::dns {

  include dns::server

  # Forwarders
  dns::server::options { '/etc/named/named.conf':
    forwarders => [ '192.168.11.10', '8.8.8.8', '8.8.4.4' ]
  }

  # Forward Zone
  dns::zone { 'gameforce.net':
    soa         => 'kam.gameforce.net',
    soa_email   => 'systems.gameforce.net',
    nameservers => ['kam'],
  }

  # Reverse Zone
  dns::zone { '11.168.192.IN-ADDR.ARPA':
    soa         => 'kam.gameforce.net',
    soa_email   => 'systems.gameforce.net',
    nameservers => ['kam'],
  }

  # A Records:
  dns::record::a {
    'kam':
      zone => 'gameforce.net',
      data => ['192.168.11.10'],
      ptr  => 'true';
    'ads':
      zone => 'gameforce.net',
      data => ['192.168.11.11'],
      ptr  => true;
    'sbs':
      zone => 'gameforce.net',
      data => ['192.168.11.12'],
      ptr  => true;
    'dmx':
      zone => 'gameforce.net',
      data => ['192.168.11.13'],
      ptr  => true;
    'pms':
      zone => 'gameforce.net',
      data => ['192.168.11.14'],
      ptr  => true;
  }

  # MX Records:
  dns::record::mx { 'mx,10':
      zone       => 'gameforce.net',
      preference => 10,
      data       => 'kam.gameforce.net';
  }

  # NS Records:
  dns::record::ns {
    'gameforce.net':
      zone => 'gameforce.net',
      data => 'kam',
  }

  # CNAME Records:
  dns::record::cname { 'mail':
    zone => 'gameforce.net',
    data => 'kam.gameforce.net',
  }

  dns::record::cname { 'sickrage':
    zone => 'gameforce.net',
    data => 'dmx.gameforce.net',
  }

  dns::record::cname { 'trans':
    zone => 'gameforce.net',
    data => 'dmx.gameforce.net',
  }

  dns::record::cname { 'plex':
    zone => 'gameforce.net',
    data => 'pms.gameforce.net',
  }

  # TXT Records:
  dns::record::txt { 'plex':
    zone => 'gameforce.net',
    data => 'Plex Media Server',
  }

  dns::record::txt { 'sickrage':
    zone => 'gameforce.net',
    data => 'Sickrage and Transmission Server',
  }
}
