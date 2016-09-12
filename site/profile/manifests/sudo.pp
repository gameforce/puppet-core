# requires saz-sudo from the forge
class profile::sudo {
  include sudo
  include sudo::configs
}
