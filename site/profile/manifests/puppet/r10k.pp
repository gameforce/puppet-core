class profile::puppet::r10k {

  # r10k setup
  class { 'r10k':

    # change this to your actual puppet control repo
    remote => 'git@github.com:gameforce/puppet-core.git',
  }
}
