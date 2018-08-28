class profile::nfs::server {
  class { '::nfs':
    server_enabled => true,
  }

  # exports for nfs
  nfs::server::export{ '/data':
    ensure  => 'mounted',
    clients => '192.168.11.0/24(rw,insecure,async,no_root_squash) localhost(rw)'
  }
}
