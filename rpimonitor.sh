#!/bin/sh
 sudo wget http://goo.gl/vewCLL -O /etc/apt/sources.list.d/rpimonitor.list

 sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F
    sudo apt-get update
    sudo apt-get install rpimonitor
