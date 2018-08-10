# Set the hostname in kickstart with windows shcp reservation hack
#!/bin/bash
IPADDR=$(ip route get 192.168.11.254 | awk '{print $NF;exit}')
HOSTNAME=box$(ip route get 192.168.11.254 | awk -F. '{print $NF;exit}')
HWADDR=$(ip link show eth0 | tail -1 | awk '{print $2}' | sed 's/://g')
mkdir /mnt/tmp
mount -o nolock nfs:/data/systems /mnt/tmp
cp -r /mnt/tmp/tools/.ssh /root
umount -l /mnt/tmp
ssh -o StrictHostKeyChecking=no administrator@ads1 "Add-DhcpServerv4Reservation -ScopeId 192.168.11.0 -IPAddress $IPADDR -ClientId $HWADDR -Description PXE -Name $HOSTNAME"
echo -e "NETWORKING=yes\nHOSTNAME=$myhostname" > /etc/sysconfig/network
echo "network --device eth0 --bootproto dhcp --noipv6 --onboot=yes --hostname=${HOSTNAME}" > /tmp/network.txt
echo -e "Setting IP to $IPADDR and HOSTNAME to $HOSTNAME and adding reservation"
