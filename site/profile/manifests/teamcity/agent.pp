class  profile::teamcity::agent {

  # install the latest perforce client
  class { 'teamcity::params':
    agent_master_url => 'http://tc-server:8111',
  }

  teamcity::agent { '${ipaddress_eth0}.agent0': }
  teamcity::agent { '${ipaddress_eth0}.agent1': }
}
