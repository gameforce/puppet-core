# /etc/puppetlabs/code/environments/production/site/profile/manifests/package.pp

class profile::packages {

  if $facts['osfamily'] == 'Debian' {
    package { 'bind9utils': ensure => 'installed', }
    package { 'nfs-common': ensure => 'installed', }
    package { 'nmap': ensure => 'installed', }
    package { 'zsh':  ensure => 'installed', }
    package { 'tmux': ensure => 'installed', }
    package { 'vim':  ensure => 'installed', }
    package { 'wget': ensure => 'installed', }
    package { 'htop': ensure => 'installed', }
  }

  elsif $facts['osfamily'] == 'RedHat'  {
    package { 'epel-release': ensure => 'installed', }
    package { 'bind-utils': ensure   => 'installed', }
    package { 'nfs-utils': ensure    => 'installed', }
    package { 'nmap': ensure         => 'installed', }
    package { 'zsh': ensure          => 'installed', }
    package { 'tmux': ensure       => 'installed', }
    package { 'vim-enhanced': ensure => 'installed', }
    package { 'wget': ensure         => 'installed', }
    package { 'htop': ensure         => 'installed', }
  }
  else {}
}
