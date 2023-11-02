#!/bin/bash

echo "enabling firewall . . ."
sudo ufw enable

echo "updating software(s)"
sudo apt update
sudo apt -y upgrade

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

echo "configuring sshd"
sudo cp ssh_config /etc/ssh/ssh_config
sudo cp sshd_config /etc/ssh/sshd_config

echo "configuring ports (for ssh/sshd)"
sudo ufw allow 42069 && echo "port 42069 opened"
sudo ufw deny 22 && echo "port 22 closed"

sleep 1

echo "configuring password security"
sudo cp login.defs /etc/login.defs
sudo cp common-password /etc/pam.d/common-password

sleep 1

echo "configuring sudoers"
sudo cp sudoers /etc/sudoers

echo "looking for critical services (delete any not in readme)"
dpkg -l | grep sshd
dpkg -l | grep openvpn
dpkg -l | grep apache
dpkg -l | grep nginx
dpkg -l | grep vsftpd
dpkg -l | grep xinetd
#dpkg -l | grep xserver
#dpkg -l | grep cups
#dpkg -l | grep avahi
dpkg -l | grep slapd
dpkg -l | grep nfs-kernel-server
dpkg -l | grep samba
dpkg -l | grep squid
dpkg -l | grep snmpd
dpkg -l | grep isc-dhcp-server
#dpkg -l | grep bind9
dpkg -l | grep apache2
dpkg -l | grep dovecot
#dpkg -l | grep rsync
#i dont know if i need to remove all of these if not in readme; check before commiting
echo "do sudo apt purge *[package]* to remove, only remove services not listed in the readme"



