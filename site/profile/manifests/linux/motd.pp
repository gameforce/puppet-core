# /etc/puppetlabs/code/environments/production/site/profile/manifests/motd.pp
# requires saz-motd from the forge
class profile::motd {
  include motd
}
