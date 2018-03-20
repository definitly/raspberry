#!/bin/sh
sysctl -w net.ipv4.ip_forward=1
route del -net 192.168.1.0 netmask 255.255.255.0 dev wlan0
route add 192.168.1.254 dev wlan0
sysctl -w net.ipv4.conf.eth0.proxy_arp=1
sysctl -w net.ipv4.conf.wlan0.proxy_arp=1