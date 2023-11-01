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
sudo cd sudoers /etc/sudoers
