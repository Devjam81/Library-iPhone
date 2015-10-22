#!/bin/bash
# Elrhk 12/01/2015 - install auto
# build script for Libimobiledevice (all libs)

successlibs=()
failedlibs=()
libs=( "libplist" "libusbmuxd" "libimobiledevice" "usbmuxd" "libirecovery" \
	"ideviceinstaller" "libideviceactivation" "idevicerestore" "ifuse" )

spinner() {
    local pid=$1
    local delay=0.75
    local spinstr='|/-\'
    echo "$pid" > "/tmp/.spinner.pid"
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

buildlibs() {
	for i in "${libs[@]}"
	do
		echo -e "\033[1;32mFetching $i..."
		git clone https://github.com/libimobiledevice/${i}.git
		cd $i
		echo -e "\033[1;32mConfiguring $i..."
		./autogen.sh
		./configure
		echo -e "\033[1;32mBuilding $i..."
		make && sudo make install
		echo -e "\033[1;32mInstalling $i..."
		cd ..
	done
	echo -e "\033[0m"
	
	echo -e "sudo ldconfig"
}

function main {
	buildlibs
}
echo -e "\033[1;37mLibimobiledevice library build script - Elrhk 2015"
main
