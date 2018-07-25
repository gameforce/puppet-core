class profile::windows {

  include ::openvmtools

  # set environment variables
  exec { 'SetPath':
    command   => 'Set-Variable -Name PATH -Value "%PATH%;C:\Tools" -Option Constant -Scope Global -Force',
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
