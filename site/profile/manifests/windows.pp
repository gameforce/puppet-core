class profile::windows {

  include ::openvmtools

  # set environment stuff

  #Set execution policy
  exec { 'ExecutionPolicy':
    command   => 'Set-ExecutionPolicy Bypass -Scope Process -Force',
    provider  => powershell,
 }

  # install telnet client
  exec { 'TelnetClient':
    command   => 'Enable-WindowsOptionalFeature -Online -FeatureName "TelnetClient"',
    provider  => powershell,
 }
  # for windows server use windowsfeature
  #windowsfeature { 'TelnetClient':
  #ensure => present,
  #}
}
