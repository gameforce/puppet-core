# puppet infra on redhat and derivatives
This repo shows how to build a puppet infra on CentOS/RedHat 7

### Enable the puppet repo
``` 
sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
```

### Install puppet server, don't start it yet
```
install puppetserver
If installing on centos 8 run update-crypto-policies --set LEGACY
```

### Clone this repo
```
mkdir git
cd git
git clone https://github.com/gameforce/puppet-core
```

### Setup puppet bits
#### Setup DNS if you need it, either a puppet CNAME or edit hosts and add puppet to localhost
#### Copy configs in place and start the server
```
sudo rsync -av files/puppet/ /etc/puppetlabs/puppet/
sudo systemctl start puppetserver
```

#### Install r10k:
```
ln -s /opt/puppetlabs/bin/puppet /usr/bin/
cd /etc/puppetlabs/puppet/code/environments/production
sudo puppet module install puppet-r10k
sudo puppet apply modules/r10k/manifests/init.pp
or use gem install method (describe)
```

### Use r10k to install the rest of the modules
#### Edit the Puppetfile to make sure you need the modules in it, comment out what you don't need
```
cd %HOME/git/puppet-core
sudo r10k puppetfile install
vi site
```
#### Do a puppet run
```
puppet agent --test
```
#### Should install everything you need. If not go back through the list and fix the issue


### Optional: Install razor-server package and dependencies
```
yum install -y razor-server
```
#### Install tftp server and copy script and bootloaders:
#### TODO: example
#### Copy the microkernel in the razor repo:
#### TODO: example
#### Log on to the postgres admin console:
```
sudo -u postgres psql postgres
```
#### Edit config.yaml and set the password:
```
vim /etc/puppetlabs/razor-server/config.yaml
```
#### Create the databases for razor and give access to the razor user:
```
create user razor password 'razor';
create database razor_prd;
create database razor;
create database razor_dev;
GRANT ALL PRIVILEGES ON DATABASE razor_prd TO razor;
GRANT ALL PRIVILEGES ON DATABASE razor TO razor;
GRANT ALL PRIVILEGES ON DATABASE razor_dev TO razor;
\q
```
#### Create the schema:
```
razor-admin -e production migrate-database
service razor-server start
```
#### Install razor client:
```
gem install razor-client
```

#### Create alias to point to the right razor server:
```
alias razor='razor -u http://razor:8150/api'
```
#### Create razor repos for your OS needs, I use ubuntu and windows:
#### TODO: Change centos to ubuntu
```
razor create-repo --name centos --iso-url http://kam/iso/CentOS-7-x86_64-DVD-1511.iso --task centos
razor create-repo --name vyos #TODO (based off debian)
razor create-repo --name ubuntu #TODO
razor create-repo --name windows #TODO
```
#### Create razor brokers:
```
razor create-broker --name noop --broker-type noop`
razor create-broker --name puppet -c server=kam.lab.gameforce.net -c environment=staging --broker-type puppet
```
#### Create razor tags for each server using the macaddress fact (use your own mac addresses)
```
razor create-tag --name kam --rule '["=", ["fact", "macaddress"], "08:00:27:a6:16:e5"]'
razor create-tag --name dmx --rule '["=", ["fact", "macaddress"], "08:00:27:14:4e:dd"]'
razor create-tag --name ads --rule '["=", ["fact", "macaddress"], "08:00:27:2d:2f:99"]'
razor create-tag --name pms --rule '["=", ["fact", "macaddress"], "08:00:27:d8:af:b6"]'
razor create-tag --name gms --rule '["=", ["fact", "macaddress"], "08:00:27:0e:3f:64"]'
razor create-tag --name rtr --rule '["=", ["fact", "macaddress"], "08:00:27:e6:34:33"]'
```
#### Create razor policies for each server tied with bound to the tag:
```
razor create-policy --name kam --repo centos --tag kam --hostname 'kam.lab.gameforce.net' --root-password 'secret' --broker puppet --task centos
razor create-policy --name dmx --repo centos --tag dmx --hostname 'dmx.lab.gameforce.net' --root-password 'secret' --broker puppet --task centos
razor create-policy --name pms --repo centos --tag pms --hostname 'pms.lab.gameforce.net' --root-password 'secret' --broker puppet --task centos
razor create-policy --name gms --repo centos --tag gms --hostname 'gms.lab.gameforce.net' --root-password 'secret' --broker puppet --task centos
razor create-policy --name rtr --repo vyos --tag rtr --hostname 'rtr.lab.gameforce.net' --root-password 'secret' --broker puppet --task vyos
razor create-policy --name ads --repo windows --tag ads --hostname 'ads.lab.gameforce.net' --root-password 'secret' --broker noop --task windows
```
### TODO
#### Describe some workflows
#### Going forward
#### What to do next

### Disclaimer
#### Use at your own risk, if this breaks your server it's your fault not mine.

