class profile::windows {

  include ::openvmtools

   # powershell module
  exec { 'TelnetClient':
    command   => 'Enable-WindowsOptionalFeature -Online -FeatureName "TelnetClient"',
    provider  => powershell,
 }
  # for windows server use windowsfeature
  #windowsfeature { 'TelnetClient':
  #ensure => present,
  #}
}
