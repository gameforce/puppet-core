class profile::sssd {

  # mod 'walkamongus-sssd', '2.0.1'
  class { '::realmd':
  domain               => 'gameforce.net',
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
      'shell_fallback'                 => '/bin/bash',
      'ldap_id_mapping'                => true,
      'ldap_idmap_range_min'           => '10000',
      'ldap_idmap_range_max'           => '20000',
      'ldap_idmap_range_size'          => '10000',
      'enumerate'                      => true,
      'fallback_homedir'               => '/home/%u',
      },
    },
  }
}
