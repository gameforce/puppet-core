# Include hiera classes
hiera_include('classes')

# Include default modules
node default {
  include firewall
  include ntp
  include shell
  include user
  include package
}
