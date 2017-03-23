class profile::logperm {

  case $::osfamily {
    'RedHat': {
      $logfiles = [
        '/var/log/messages',
        '/var/log/cron',
        '/var/log/maillog',
        '/var/log/spooler',
        '/var/log/secure'
      ]
    'Debian': {
      $logfiles = [
        '/var/log/syslog',
        '/var/log/auth.log'
    }
    default: {fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}. Please update logperm class.")}
  }

  file { $logfiles:
    mode => 'a+r',
  }

}
