#!/bin/bash

#sudo su

echo "enabling firewall . . ."
sudo ufw enable

echo "removing unautorized (mostly just stuff thas default to kali linux)"
sudo apt purge -y *hashcat*
sudo apt purge -y *telnet*
sudo apt purge -y *netcat*
sudo apt purge -y *wireshark*
sudo apt purge -y *nmap*
sudo apt purge -y *metasploit*
sudo apt purge -y *sqlmap*
sudo apt purge -y *lynis*
sudo apt purge -y *burpsuite*
sudo apt purge -y *aircrack-ng*
sudo apt purge -y *autopsy*
sudo apt purge -y *setoolkit*
sudo apt purge -y *irpas*
sudo apt purge -y *zeitgeist*
sudo apt purge -y *pdfcrack*
sudo apt purge -y *sipcrack*
sudo apt purge -y *pyrit*
sudo apt purge -y *ophcrack*
sudo apt purge -y *lcrack*
sudo apt purge -y *rarcrack*
sudo apt purge -y *hydra*
sudo apt purge -y john
sudo apt purge -y john-data
sudo apt purge -y *fcrackzip*
sudo apt purge -y *aircrack-ng*

#######################START CONFIGS

echo "configuring sshd"
#sudo cp ssh_config /etc/ssh/ssh_config
#sudo cp sshd_config /etc/ssh/sshd_config
sudo sed -i '/Protocol/d' /etc/ssh/sshd_config
sudo sed -i '/Protocol/d' /etc/ssh/ssh_config  

sudo sed -i '/RSAAuthentication/d' /etc/ssh/ssh_config
sudo sed -i '/RSAAuthentication/d' /etc/ssh/sshd_config

sudo sed -i '/PubkeyAuthentication/d' /etc/ssh/sshd_config
sudo sed -i '/PubkeyAuthentication/d' /etc/ssh/ssh_config

sudo sed -i '/HostbasedAuthentication/d' /etc/ssh/sshd_config
sudo sed -i '/HostbasedAuthentication/d' /etc/ssh/ssh_config

sudo sed -i '/PermitEmptyPasswords/d' /etc/ssh/sshd_config
sudo sed -i '/PermitEmptyPasswords/d' /etc/ssh/ssh_config

sudo sed -i '/PermitRootLogin/d' /etc/ssh/sshd_config
sudo sed -i '/PermitRootLogin/d' /etc/ssh/ssh_config

sudo sed -i '/X11Forwarding/d' /etc/ssh/sshd_config
sudo sed -i '/X11Forwarding/d' /etc/ssh/ssh_config

sudo echo 'Protocol 2' >> /etc/ssh_config
sudo echo 'Protocol 2' >> /etc/sshd_config

sudo echo 'RSAAuthentication yes' >> /etc/ssh_config
sudo echo 'RSAAuthentication yes' >> /etc/sshd_config

sudo echo 'PubkeyAuthentication yes' >> /etc/ssh_config
sudo echo 'PubkeyAuthentication yes' >> /etc/sshd_config

sudo echo 'HostbasedAuthentication no' >> /etc/ssh_config
sudo echo 'HostbasedAuthentication no' >> /etc/sshd_config

sudo echo 'PasswordAuthentication no' >> /etc/ssh_config
sudo echo 'PasswordAuthentication no' >> /etc/sshd_config

sudo echo 'PermitEmptyPasswords no' >> /etc/ssh_config
sudo echo 'PermitEmptyPasswords no' >> /etc/sshd_config

sudo echo 'PermitRootLogin no' >> /etc/ssh_config
sudo echo 'PermitRootLogin no' >> /etc/sshd_config

sudo echo 'X11Forwarding no' >> /etc/ssh_config
sudo echo 'X11Forwarding no' >> /etc/sshd_config

echo "configuring ports (for ssh/sshd)"
sudo ufw allow 42069 && echo "port 42069 opened"
sudo ufw deny 22 && echo "port 22 closed"

cd ~
wget https://github.com/klaver/sysctl/blob/master/sysctl.conf
sudo mv sysctl.conf /etc/sysctl.conf

###############END CONFIGS OR SOMETHING

sleep 1

echo "changing perms"
sudo chmod 755 /etc
sudo chmod 640 /etc/shadow
sudo chmod ~/.bash_history

echo "configuring password security"
sudo cp login.defs /etc/login.defs
sudo cp common-password /etc/pam.d/common-password

sleep 1

echo "configuring sudoers"
sudo cp sudoers /etc/sudoers

echo "deleteing a bunch of critical services IF U LOSE POINTS JUST RE ADD THEM BACK"
sudo apt purge -y sshd
sudo apt purge -y openvpn
sudo apt purge -y apache
sudo apt purge -y nginx
sudo apt purge -y vsftpd
sudo apt purge -y xinetd
#dpkg -l | grep -y xserver
#dpkg -l | grep -y cups
#dpkg -l | grep -y avahi
sudo apt purge -y slapd
sudo apt purge -y nfs-kernel-server
sudo apt purge -y squid
sudo apt purge -y isc-dhcp-server
#dpkg -l | grep bind9
sudo apt purge -y apache2
sudo apt purge -y dovecot
#dpkg -l | grep rsync
#i dont know if i need to remove all of these if not in readme; check before commiting

sleep 1

echo "updating software(s)"
sudo apt -y autoremove
sudo apt update
sudo apt -y upgrade

echo "remove ALL mp3/mp4 files? [y/n]"
echo "WARNING, THIS IS NOT REVERSIBLE . . . OR SOMETHING"
read
ans=$REPLY

if [ $ans == 'y' ]; then
    echo "removing files . . . (this may take a while)"
    cd /
    sudo find . -name '*.mp3*' -exec rm {} \;
    sudo find . -name '*.mp4*' -exec rm {} \;
    cd ~
    echo "removed all mp3/4 files"
else
    echo "no changes made"
fi
