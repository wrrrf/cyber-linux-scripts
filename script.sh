#!/bin/bash
sudo ufw enable
sudo apt update
sudo apt upgrade
sudo apt purge *hashcat*
sudo apt purge *telnet*
sudo apt purge *netcat*
sudo apt purge *wireshark*
sudo apt purge *nmap*
