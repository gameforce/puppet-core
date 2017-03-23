# profile::r10k
class profile::r10k {

class { 'r10k':
  remote => 'git@github.com:gameforce/puppet-core.git',
  }

 sshkey { "obiwan.gameforce.net":
  ensure   => present,
  type     => "ssh-rsa",
  target   => "/root/.ssh/known_hosts",
  key      => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWg47Ju199L8HCCnoknYvqjHyT/uWK0w+s8I/U163e3CX6Uux1ud4AvO4tlUZAhdqeCmBzyMjiXWpDhjf1JUrEpgCi9+Si0UO2rNpSJuSadU5acgVIIip5h1Qt8BZX0EIAEWeruM6rnaqstT4NwK9+oGTwdN6ukI8yum37Zh0au62xfH1RJRCcZGYmd6QvGcfDgUizIPa2JztiCQr8UfmEaaC2UreK3TDGgxBT0suRSd9JenpZYIbxePsvLtv/dI9eocskzzlKj+4q7XYKoXtOfGWrJ96yNRMgtCRJC2pESObGT+WtkVYltH6jHzgLH4ClPbRq7vv+iZf2N3E8L/fx r10k"
 }

class { '::r10k::webhook::config':
  protected        => false,
  use_mcollective => false,
  public_key_path  => "/etc/puppetlabs/puppet/ssl/ca/signed/${facts['fqdn']}.pem",
  private_key_path => "/etc/puppetlabs/puppet/ssl/private_keys/${facts['fqdn']}.pem",
  notify           => Service['webhook'],
  }

class { '::r10k::webhook':
  user    => 'puppet',
  group   => 'puppet',
  require => Class['::r10k::webhook::config'],
  }
}
