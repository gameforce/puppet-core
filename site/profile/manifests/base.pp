# base profile class
class profile::base {

  # includes
  include ::openvmtools

  # site specific environment
  $sitepath = '/net/systems/bin:/opt/puppetlabs/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin'
  file { '/etc/profile.d/site.sh':
    content => "export PATH=${sitepath}\n",
    mode    => '0644'
  }

  file { '/etc/bashrc':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///files/site/bashrc',
   }

  # mod 'saz-motd', '2.4.0'
  class { 'motd': }

  # mod 'puppetlabs-ntp', '6.2.0'
  class { '::ntp':
    servers => [ 'clock' ],
  }

  # Disable ipv6 via sysctl run dracut -f if it breaks rpcbind
  sysctl::value { 'net.ipv6.conf.all.disable_ipv6':
      value  => '1'
  }

  # mod 'puppetlabs-firewall', '1.9.0'
  class { 'firewall':
    ensure => 'stopped',
  }

  # mod 'saz-sudo', '4.2.0'
  class { 'sudo': }
  sudo::conf { 'systems':
    priority =>   10,
    source   =>   'puppet:///files/sudo/systems.conf',
  }

  # puppet agent cron job
  cron { 'puppet-agent':
    ensure  => 'present',
    command => '/opt/puppetlabs/bin/puppet agent --onetime --no-daemonize --splay --splaylimit 60',
    minute  => ['30'],
    target  => 'root',
    user    => 'root',
  }

  # mod 'walkamongus-sssd', '2.0.1'
  class { '::realmd':
  domain               => 'ad0.owi.lan',
  # setup link for the domain join user: https://richardstk.com/2013/11/29/create-a-dedicated-account-to-join-computers-to-a-domain/
  domain_join_user     => 'domainjoin',
  domain_join_password => '#thx1138',
  krb_ticket_join      => false,
  #  krb_keytab        => '/etc/keytab',
  manage_sssd_config   => true,
  sssd_config          => {
    'sssd'               => {
      'domains'             => $::domain,
      'config_file_version' => '2',
      'services'            => 'nss,pam',
    },
    "domain/${::domain}" => {
      'ad_domain'                      => $::domain,
      'krb5_realm'                     => upcase($::domain),
      'realmd_tags'                    => 'manages-system joined-with-adcli',
      'cache_credentials'              => 'True',
      'id_provider'                    => 'ad',
      'access_provider'                => 'ad',
      'krb5_store_password_if_offline' => 'True',
      'default_shell'                  => '/bin/bash',
      'ldap_id_mapping'                => false,
      'enumerate'                      => true,
      'fallback_homedir'               => '/home/%u',
      },
    },
  }
}
