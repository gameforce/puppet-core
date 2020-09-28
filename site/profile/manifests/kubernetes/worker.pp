# kubernetes cluster
class profile::kubernetes::worker {

    # install worker node
    class {'kubernetes':
    worker => true,
  }
}
