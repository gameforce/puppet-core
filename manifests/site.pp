# Merge several arrays of class names into one array:
#lookup('classes', {merge => 'hash'})
hiera_include('classes')

filebucket { 'main':
  server => $::servername,
  path   => false,
}

File { backup => 'main' }

Package {
  allow_virtual => true,
}

node 'kube-master' {
  include role::kubernetes::master
}

node /^kube-replica-master/ {
  include role::kubernetes::controller
}

node /^kube-node/  {
  include role::kubernetes::worker
}
