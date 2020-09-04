class role::docker {
  #All roles should include the common profile
  include profile::common
  include profile::docker
  include profile::docker_compose
}
