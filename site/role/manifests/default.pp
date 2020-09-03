class role::default {
  #All roles should include the common profile
  include profile::common
  include profile::autofs
}
