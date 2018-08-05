# base profile class
class profile::base {

  # includes
  include ::openvmtools
  include ::ntp

  # site specific environment
  $sitepath = '/net/systems/bin:/opt/puppetlabs/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin'
  file { '/etc/profile.d/site.sh':
    content => "export PATH=${sitepath}\n",
    mode    => '0644'
  }

#  file { '/etc/bashrc':
#    ensure => 'present',
#    owner  => 'root',
#    group  => 'root',
#    mode   => '0644',
#    source => 'puppet:///files/site/bashrc',
#   }

  # puppet agent cron job
  cron { 'puppet-agent':
    ensure  => 'present',
    command => '/opt/puppetlabs/bin/puppet agent --onetime --no-daemonize --splay --splaylimit 60',
    minute  => ['30'],
    target  => 'root',
    user    => 'root',
  }
}
