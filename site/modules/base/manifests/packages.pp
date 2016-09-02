class base::packages {
  package { 'screen': ensure => 'installed', }
  package { 'epel-release': ensure => 'installed', }
  package { 'git': ensure => 'installed', }
  package { 'vim-enhanced': ensure => 'installed', }
  package { 'nmap': ensure => 'installed', }
  package { 'zsh': ensure => 'installed', }
}
