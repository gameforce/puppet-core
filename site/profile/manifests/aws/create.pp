# create intances on vpc-9b854ce1
# puppet apply /etc/puppetlabs/code/environments/production/site/profile/manifests/aws/create.pp
#
ec2_instance { 'teamcity.owi.test':
    ensure            => running,
    region            => 'us-east-1',
    availability_zone => 'us-east-1d',
    image_id          => 'ami-3a7c6e45', # OWI AMI with puppet pre-installed
    instance_type     => 't2.small',
    key_name          => 'OffworldSystems',
    subnet            => 'Private Subnet', # private subnet
    security_groups   => ['systems-all'],
    block_devices       => [ {"delete_on_termination"=>"true", "device_name"=>"/dev/sdc", "volume_size"=>100, "encrypted"=>"Yes",}, {"delete_on_termination"=>"true", "device_name"=>"/dev/sde", "volume_size"=>1000, "encrypted"=>"Yes",}, ],
    tags              => {
      tag_name => 'value',
    },
}

# Perforce vancouver edge
ec2_instance { 'pf0-van-edge.owi.test':
    ensure            => running,
    region            => 'us-east-1',
    availability_zone => 'us-east-1d',
    image_id          => 'ami-3a7c6e45', # OWI AMI with puppet pre-installed
    instance_type     => 't2.small',
    key_name          => 'OffworldSystems',
    subnet            => 'Private Subnet', # private subnet
    security_groups   => ['systems-all'],
    block_devices       => [ {"delete_on_termination"=>"true", "device_name"=>"/dev/sdc", "volume_size"=>100, "encrypted"=>"Yes",}, {"delete_on_termination"=>"true", "device_name"=>"/dev/sde", "volume_size"=>1000, "encrypted"=>"Yes",}, ],
    tags              => {
      tag_name => 'value',
    },
}
