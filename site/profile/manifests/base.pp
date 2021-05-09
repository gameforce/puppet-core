class profile::base {
  # packages
  include profile::packages

  # sshd config
  include profile::ssh::server
  include profile::ssh::client

  exec {'shosts.equiv':
    command => '/bin/cat /etc/ssh/ssh_known_hosts | /bin/grep -v "^#" | /bin/awk \'{print $1}\' | /bin/sed -e \'s/,/\n/g\' > /etc/ssh/shosts.equiv',
    require => Class['ssh::knownhosts'],
  }

#    # site specific environment
#    $sitepath = '/net/systems/bin:/opt/puppetlabs/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin'
#    file { '/etc/profile.d/site.sh':
#      content => "export PATH=${sitepath}\n",
#      mode    => '0644'
#    }

    # set locale
    class { 'locales':
      default_locale   => 'en_US.UTF-8',
      locales          => ['en_US.UTF-8','en_CA.UTF-8','UTF-8']
  }
}
