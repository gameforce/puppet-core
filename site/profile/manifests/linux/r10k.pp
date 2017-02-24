# profile::r10k
class profile::r10k {

class { 'r10k':
  remote => 'git@kam:/srv/git/puppet-core',
  }
 
 sshkey { "kam.fusefx.studio":
  ensure   => present,
  type     => "ssh-rsa",
  target   => "/root/.ssh/known_hosts",
  key      => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5LYoAARCPzuODP+aZVctJmbeSdEnFrAA8ihrQu3Na50cSpafX8BXcdaonmVqi4rwT0qa52lqrS/JdHXmrU4yN7KeFiVaAYMY8jxWTLdc5uSTLkEssa1lGzBuGTDGnXU7dnkigSMnfj3Jz7VQEGyvihwwXNJbqwiWYlxzkqNDit8TkV2OOCvq1TtOsNR8Sb+pegtitxWpHrjwQjklPUmwQkBDT2mYUI9f2ZHOgNAgLoTHcCRh4OtevuylPS8LPe9kgvsPrefKPzoGiibDAzFBBuYNxu+1YsGeLvWU0NQHqlWxr6Th+GjURFctE9iSOk5kth7MRV7zYAq6Vb5MTozOj git@fusefx"
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
