# /etc/puppetlabs/code/environments/production/site/profile/manifests/package.pp
# TODO
# -- add provider for homebrew

class profile::macos::package {

  class { 'homebrew':
    user  => systems,
    group => brew,
  }

  package { 'coreutils':
    ensure => 'installed',
    provider => brew,
  }

  package { 'git':
    ensure => 'installed',
    provider => brew,
  }

  package { 'nmap':
    ensure => 'installed',
    provider => brew,
  }

  package { 'macvim':
    ensure => 'absent',
    provider => brew,
  }

  package { 'wget':
    ensure => 'installed',
    provider => brew,
  }

  package { 'htop':
    ensure => 'installed',
    provider => brew,
  }

  package { 'grc':
    ensure => 'installed',
    provider => brew,
  }

  package { 'keychain':
    ensure => 'installed',
    provider => brew,
  }
}
