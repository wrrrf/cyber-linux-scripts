#!/bin/bash

echo "enabling firewall . . ."
sudo ufw enable

echo "updating software(s)"
sudo apt update
sudo apt upgrade

echo "removing unautorized (mostly just stuff thas default to kali linux)"
sudo apt purge *hashcat*
sudo apt purge *telnet*
sudo apt purge *netcat*
sudo apt purge *wireshark*
sudo apt purge *nmap*
sudo apt purge *metasploit*
sudo apt purge *sqlmap*
sudo apt purge *lynis*
sudo apt purge *burpsuite*
sudo apt purge *aircrack-ng*
sudo apt purge *autopsy*
sudo apt purge *setoolkit*

echo "configuring sshd"
sudo cp ssh_config /etc/ssh/ssh_config
sudo cp sshd_config /etc/ssh/sshd_config
