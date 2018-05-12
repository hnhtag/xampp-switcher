#!/bin/bash

# Author : hnhtag
# copyright (c) hnhtag.github.io
# Solution for Installing 2x versiion of xampp in linux
# Xampp Switcher 0.1Aplha (l0001)
#
#
#
#
#
clear
echo "	Xampp 2xVersion Switcher"
echo "	by hnhtag"
# getting version from xs.ini
current_version=$(awk -F "=" '/current_version/ {print $2}' xs.ini)
cd /opt/lampp/
if [[ $current_version == '5.6.35' ]]; then
	echo ""
	echo 'Current xampp version : 5.6.35'
	echo 'You are going to change to version 7.2.3.'
	read -r -p "Are you sure? [Y/n] " response
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
	then
		#stop previous version of services
		echo ""
		cd /opt/lampp
		sudo ./xampp stop
		echo ""
		echo "Loading..............................[0%]"
		cd /opt/
		sudo mv lampp lampp-5.6.35
		echo "Loading..............................[25%]"
		sleep 3
		echo "Loading..............................[50%]"
		sudo mv lampp-7.2.3 lampp
		echo "Loading..............................[75%]"
		sleep 3
		echo "Loading..............................[100%]"
		echo ""
		cd lampp/
		sudo ./xampp start

		cd /home/hha/xs/
		sed -i 's/5.6.35/7.2.3/g' xs.ini
		echo ""
		echo 'Version changed to xampp version : 7.2.3'
	else
	    echo ""
	   	echo "Aborted!"
	   	echo ""
	fi
else
	echo ""
	echo 'Current xampp version : 7.2.3'
	echo 'You are going to change to version 5.6.35.'
	read -r -p "Are you sure? [Y/n] " response
	if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
	then
		#stop previous version of services
		echo ""
		cd /opt/lampp
		sudo ./xampp stop
		echo ""
		echo "Loading..............................[0%]"
		cd /opt/
		sudo mv lampp lampp-7.2.3
		echo "Loading..............................[25%]"
		sleep 3
		echo "Loading..............................[50%]"
		sudo mv lampp-5.6.35 lampp
		echo "Loading..............................[75%]"
		sleep 3	
		echo "Loading..............................[100%]"
		echo ""
		cd lampp/
		sudo ./xampp start

		cd /home/hha/xs/
		sed -i 's/7.2.3/5.6.35/g' xs.ini
		echo ""
		echo 'Version changed to xampp version : 5.6.35'
	else
	   echo ""
	   echo "Aborted!"
	   echo ""
	fi
fi
