# kubernetes cluster
class profile::kubernetes::master {

    # install master node
    class {'kubernetes':
    controller => true,
  }
}
