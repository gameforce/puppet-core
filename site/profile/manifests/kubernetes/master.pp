# kubernetes cluster
class profile::kubernetes::master {

    # install master node
    class {'kubernetes':
    master => true,
  }
}
