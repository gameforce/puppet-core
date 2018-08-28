class role::teamcity {
  #All roles should include the common profile
  include profile::common
  include profile::teamcity::server
}
