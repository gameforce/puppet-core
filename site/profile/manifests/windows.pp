class profile::windows {

  include ::openvmtools

  # Setting Powershell Execution Policy to unrestricted
   exec { 'Set PowerShell execution policy unrestricted':
     command   => 'Set-ExecutionPolicy Unrestricted -Force',
     unless    => 'if ((Get-ExecutionPolicy -Scope LocalMachine).ToString() -eq "Unrestricted") { exit 0 } else { exit 1 }',
     provider  => powershell
   }

  # install telnet client
  exec { 'TelnetClient':
    command   => 'Enable-WindowsOptionalFeature -Online -FeatureName "TelnetClient"',
    unless    => "if (Get-WindowsOptionalFeature -Online -FeatureName TelnetClient) { exit 0 } else { exit 1 }",
    provider  => powershell,
 }
  # for windows server use windowsfeature
  #windowsfeature { 'TelnetClient':
  #ensure => present,
  #}
}
