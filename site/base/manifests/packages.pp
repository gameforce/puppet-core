class base::packages {
  package { 'epel-release': ensure => 'installed', }
  package { 'git': ensure => 'installed', }
  package { 'htop': ensure => 'installed', }
  package { 'nmap': ensure => 'installed', }
  package { 'screen': ensure => 'installed', }
  package { 'vim-enhanced': ensure => 'installed', }
  package { 'zsh': ensure => 'installed', }
}
