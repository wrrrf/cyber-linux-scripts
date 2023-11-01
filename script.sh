#!/bin/bash
sudo ufw enable
sudo apt update
sudo apt upgrade
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

