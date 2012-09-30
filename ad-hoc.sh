#!/bin/bash
ifconfig wlan0 down
iwconfig wlan0 mode ad-hoc
iwconfig wlan0 essid "Pi"
ifconfig wlan0 10.0.0.1 netmask 255.255.255.0
ifconfig wlan0 up

iptables-restore < iptables.conf

