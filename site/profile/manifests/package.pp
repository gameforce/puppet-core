# /etc/puppetlabs/code/environments/production/site/profile/manifests/package.pp
class profile::package {
  #package { 'epel-release': ensure => 'installed', }
  #package { 'git': ensure => 'installed', }
  package { 'dnsutils': ensure => 'installed', }
  package { 'nfs-common': ensure => 'installed', }
  package { 'nmap': ensure => 'installed', }
  package { 'zsh': ensure => 'installed', }
  package { 'screen': ensure => 'installed', }
  package { 'vim-nox': ensure => 'installed', }
  package { 'wget': ensure => 'installed', }
  package { 'htop': ensure => 'installed', }
}
