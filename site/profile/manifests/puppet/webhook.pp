class profile::puppet::webhook {

  # webook config for github
  class { '::r10k::webhook::config':
    protected        => false,
    use_mcollective  => false,
    public_key_path  => "/etc/puppetlabs/puppet/ssl/ca/signed/${facts['fqdn']}.pem",
    private_key_path => "/etc/puppetlabs/puppet/ssl/private_keys/${facts['fqdn']}.pem",
  }

  class { '::r10k::webhook':
    user  => 'puppet',
    group => 'puppet',
  }
}
