# destroys intances on vpc-9b854ce1
# puppet apply /etc/puppetlabs/code/environments/production/site/profile/aws/destroy.pp
#
ec2_instance { 'perforce.owi.test':
  ensure            => absent,
  region            => 'us-east-1',
  availability_zone => 'us-east-1d',
  image_id          => 'ami-3a7c6e45', # OWI AMI with puppet pre-installed
  instance_type     => 't2.small',
  key_name          => 'OffworldSystems',
  subnet            => 'Private Subnet', # private subnet
  security_groups   => ['systems-all'],
  }
