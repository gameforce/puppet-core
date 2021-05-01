class  profile::teamcity::server {


  class { 'teamcity::params':
    agent_master_url => 'http://teamcity:8111',
  }
  include teamcity::master
}
