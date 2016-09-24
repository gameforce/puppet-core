# puppet-core
TODO: Add steps to install puppet

RAZOR SERVER INSTALLATION
=========================
#Install razor-server package and dependencies
  yum install -y razor-server

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

#Create razor repo
  razor create-repo --name centos --iso-url http://kam/iso/CentOS-7-x86_64-Minimal.iso --task centos

#Create razor broker
  razor create-broker --name puppet -c server=kam.lab.gameforce.net -c environment=vmlab --broker-type puppet

#Create razor policy
  razor create-policy --name server --repo centos --hostname ‘host${id}.lab.gameforce.net’ --root-password 'thx1138' --broker puppet --task centos
  
