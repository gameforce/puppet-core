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
    }
    'Darwin': {
      $logfiles = [
        '/var/log/system.log',
      ]
    }
    default: {fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}. Please update logperm class.")}
  }

  file { $logfiles:
    mode => 'a+r',
  }

}
