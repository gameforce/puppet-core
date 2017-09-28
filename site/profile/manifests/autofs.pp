class profile::autofs {
 include autofs
  autofs::mount { 'net':
    mount       => '/net',
    mapfile     => '/etc/auto.net.data',
    mapcontents => ['* -user,rw,soft,intr,rsize=32768,wsize=32768,tcp,nfsvers=3,noacl sidious:/data-pool'],
    options     => '--timeout=120',
    order       => 01,
  }
}
