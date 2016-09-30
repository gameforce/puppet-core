# puppet-core
TODO: Add steps to install puppet

RAZOR SERVER INSTALLATION
=========================
#Install razor-server package and dependencies
  yum install -y razor-server

#Install tftp server and copy script and bootloaders
TODO: example

#Copy the microkernel in the razor repo
TODO: example

#Log on to the postgres admin console:
  sudo -u postgres psql postgres

#Edit config.yaml and set the password
  vim /etc/puppetlabs/razor-server/config.yaml

#Create the databases for razor and give access to the razor user:
  create user razor password 'razor';
  create database razor_prd;
  create database razor;
  create database razor_dev;
  GRANT ALL PRIVILEGES ON DATABASE razor_prd TO razor;
  GRANT ALL PRIVILEGES ON DATABASE razor TO razor;
  GRANT ALL PRIVILEGES ON DATABASE razor_dev TO razor;
  \q

#Create the schema
  razor-admin -e production migrate-database
  service razor-server start

#Install razor client
  gem install razor-client

#Create alias to point to the right razor server:
  alias razor='razor -u http://razor:8150/api'

#Create razor repos we need centos, solaris and windows
  razor create-repo --name centos --iso-url http://kam/iso/CentOS-7-x86_64-DVD-1511.iso --task centos

#Create razor brokers
  razor create-broker --name noop --broker-type noop
  razor create-broker --name puppet -c server=kam.lab.gameforce.net -c environment=vmlab --broker-type puppet

#Create razor tags for each server using the macaddress fact
  razor create-tag --name kam --rule '["=", ["fact", "macaddress"], "08:00:27:a6:16:e5"]'
  razor create-tag --name dmx --rule '["=", ["fact", "macaddress"], "08:00:27:14:4e:dd"]'
  razor create-tag --name ads --rule '["=", ["fact", "macaddress"], "08:00:27:2d:2f:99"]'
  razor create-tag --name sbs --rule '["=", ["fact", "macaddress"], "08:00:27:b5:9a:21"]'
  razor create-tag --name pms --rule '["=", ["fact", "macaddress"], "08:00:27:d8:af:b6"]'


#Create razor policies for each server tied with bound to the tag
  razor create-policy --name kam --repo centos --tag kam --hostname 'kam.lab.gameforce.net' --root-password 'secret' --broker puppet --task centos
  razor create-policy --name dmx --repo centos --tag dmx --hostname 'dmx.lab.gameforce.net' --root-password 'secret' --broker puppet --task centos
  razor create-policy --name pms --repo centos --tag pms --hostname 'pms.lab.gameforce.net' --root-password 'secret' --broker puppet --task centos
  razor create-policy --name ads --repo windows --tag ads --hostname 'ads.lab.gameforce.net' --root-password 'secret' --broker noop --task windows
  razor create-policy --name sbs --repo solaris --tag sbs --hostname 'sbs.lab.gameforce.net' --root-password 'secret' --broker puppet --task solaris


pms
gms
rtr
