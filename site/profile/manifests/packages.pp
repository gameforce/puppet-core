# /etc/puppetlabs/code/environments/production/site/profile/manifests/package.pp

class profile::packages {

  if $facts['osfamily'] == 'Debian' {
    package { 'nmap': ensure => 'installed', }
    package { 'zsh':  ensure => 'installed', }
    package { 'tmux': ensure => 'installed', }
    package { 'vim':  ensure => 'installed', }
    package { 'wget': ensure => 'installed', }
    package { 'htop': ensure => 'installed', }
    package { 'keychain': ensure => 'installed', }
    package { 'git': ensure => 'installed', }
  }

  elsif $facts['osfamily'] == 'RedHat'  {
    package { 'epel-release': ensure => 'installed', }
    package { 'nmap': ensure         => 'installed', }
    package { 'zsh': ensure          => 'installed', }
    package { 'tmux': ensure       => 'installed', }
    package { 'vim-enhanced': ensure => 'installed', }
    package { 'wget': ensure         => 'installed', }
    package { 'htop': ensure         => 'installed', }
    package { 'keychain': ensure => 'installed', }
    package { 'git': ensure => 'installed', }
  }
  else {}
}
