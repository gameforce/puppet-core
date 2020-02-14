# Sets ssh client config for all instances
class profile::ssh::client {
  class { '::ssh::client':
    options => {
      'Host *' => {
        'SendEnv'                   => 'LANG LC_*',
        'HashKnownHosts'            => 'yes',
        'GSSAPIAuthentication'      => 'yes',
        'GSSAPIDelegateCredentials' => 'no',
        'HostbasedAuthentication'   => 'yes',
        'EnableSSHKeysign'          => 'yes',
      },
    },
  }
}
