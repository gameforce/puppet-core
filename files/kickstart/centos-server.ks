# General settings
text
skipx
install
url --url http://repo/centos/7.3/os/x86_64
lang en_US.UTF-8
keyboard us
rootpw --iscrypted $6$yshB3fNH$gNYCCumlYwENi31r/LYBe4jAqtLsXW1HnlaroUSJtgLK5nUAc8rXu2jdOAbUozuIjmJ2ZKv.N4S4.UwuftrQn/
authconfig --enableshadow --passalgo=sha512
firewall --disabled
selinux --disabled
timezone America/Vancouver
eula --agreed
%addon com_redhat_kdump --disable
%end

%pre
exec < /dev/tty3 > /dev/tty3
chvt 3
# Set the hostname
#!/bin/bash
hn=""
while [ "$hn" == "" ]; do
  clear
  echo " *** Please enter the server's hostname: *** "
  echo
  read -p "Hostname: " hn
done
chvt 1
HOSTNAME=${hn}
IPADDR=$(ip route get 172.16.10.2 | awk '{print $NF;exit}')
HWADDR=$(ip link show eth0 | tail -1 | awk '{print $2}' | sed 's/://g')
mkdir /mnt/tmp
mount -o nolock syn:/volume1/systems /mnt/tmp
cp -r /mnt/tmp/tools/.ssh /root
umount -l /mnt/tmp
ssh -o StrictHostKeyChecking=no administrator@ads1 "Add-DhcpServerv4Reservation -ScopeId 172.16.0.0 -IPAddress $IPADDR -ClientId $HWADDR -Description PXE -Name $HOSTNAME"
echo "network --device eth0 --bootproto dhcp --noipv6 --onboot=yes --hostname=${HOSTNAME}" > /tmp/network.txt
echo -e "Setting IP to $IPADDR and HOSTNAME to $HOSTNAME and adding reservation"
%end

# Setup netoworking
%include /tmp/network.txt

# External Package Repositories
repo --name=epel --baseurl=http://download.fedoraproject.org/pub/epel/7/x86_64/
repo --name=puppetlabs --baseurl=http://yum.puppetlabs.com/el/7/PC1/x86_64/
repo --name=puppetlabs_dependencies --baseurl=http://yum.puppetlabs.com/el/7/dependencies/x86_64/

# Internal Package Repositories
repo --name CentOS-Base --baseurl http://repo/7/os/x86_64 --install
repo --name Stellar --baseurl http://repo/stellar/x86_64 --install


# Disk Partitioning
bootloader --location=mbr --driveorder=sda --append="crashkernel=auth rhgb"
clearpart --all --initlabel
part /boot --size 500 --fstype ext3
part / --size 8192 --grow --fstype xfs
part swap --size 2048 --fstype swap
# END of Disk Partitioning

# Packages
%packages --nobase
epel-release
puppetlabs-release-pc1
puppet-agent
openssh-clients
openssh-server
acpid
autofs
cronie
crontabs
git
logrotate
perl
nfs-utils
nmap
ntp
ntpdate
rsync
sudo
which
wget
yum
xfsprogs
%end

# Services
services --enabled=postfix,network,ntpd,ntpdate,puppet

# Reboot
reboot

%post --log=/root/install-post.log
exec < /dev/tty3 > /dev/tty3
chvt 3
echo
echo "################################"
echo "# Running Post Configuration   #"
echo "################################"
(

PATH=/net/software/bin:/opt/puppetlabs/bin:/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin
export PATH

#Import GPG keys
repo --import http://repo/stellar/RPM-GPG-KEY-stellar

# Configure systype fact
mkdir -p /etc/puppetlabs/facter/facts.d
echo "systype=server" > /etc/puppetlabs/facter/facts.d/systype.txt

# Sync time and update
/usr/sbin/ntpdate clock
/sbin/hwclock -wu
/usr/bin/yum -y update

#Tell us we have reached the end
echo "We have reached the end of the post-install script"
) 2>&1 | /usr/bin/tee /var/log/install-post-sh.log
chvt 1
%end
