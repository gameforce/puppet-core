# puppet-core

STEPS TO INSTALL PUPPET
=======================
# yum check-update
# yum update
# yum upgrade
# sudo yum install git
# ssh-keygen -t rsa -C systems@fusefx
# (upload key to github)
# mkdir git
# cd git
# git clone git@github.com:gameforce/puppet-core
# sudo yum -y install ntp
# sudo ntpdate fbc-dc01
# rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
# sudo yum -y install puppetserver
# sudo systemctl start puppetserver
# rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
# yum -y install puppet-agent
# /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
# puppet cert list
# puppet agent --test

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
