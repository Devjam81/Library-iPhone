#!/bin/bash
echo -e "Dev-Jam 12/01/2015 - install auto"
echo -e "build script for insall Libimobiledevice"

#######################################################################
#
#  Project......: autobuild.sh
#  Creator......: Dev-Jam remasterized for Matteyeux le 27/12/15
#######################################################################



function depends(){

        if [[ $(which apt-get) ]]; then
                sudo apt-get install -y git build-essential make autoconf \
                automake libtool openssl tar perl binutils gcc g++ \
                libc6-dev libssl-dev libusb-1.0-0-dev \
                libcurl4-gnutls-dev fuse libxml2-dev \
                libgcc1 libreadline-dev libglib2.0-dev libzip-dev \
                libclutter-1.0-dev  \
                libfuse-dev cython python2.7 \
                libncurses5
        else
                echo "Package manager is not supported"
                exit 1
        fi
}

function brew_install(){
        # Install Hombrew.
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


        # Install command-line tools using Homebrew.

        # Ask for the administrator password upfront.
        sudo -v

        # Keep-alive: update existing `sudo` time stamp until the script has finished.
        while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

        # Make sure we’re using the latest Homebrew.
        brew update

        # Upgrade any already-installed formulae.
        brew upgrade

        # Install GNU core utilities (those that come with OS X are outdated).
        # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
        brew install coreutils
        sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

        # Install some other useful utilities like `sponge`.
        brew install moreutils
        # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
        brew install findutils
        # Install GNU `sed`, overwriting the built-in `sed`.
        brew install gnu-sed --with-default-names

        # Install Development Packages;
        brew install libxml2
        brew install libzip
        brew install libplist
        brew install openssl
        brew install clutter
        brew install cogl
        brew install usbmuxd


        # Install Software;
        brew install automake
        brew install cmake
        brew install colormake
        brew install autoconf
        brew install libtool
        brew install pkg-config
        brew install gcc
        brew install libusb
        brew install ifuse
        brew install glib

        # Install Optional;
        brew install screenfetch
        brew install Caskroom/cask/osxfuse

        # Install extras;
        brew install bfg
        brew install binutils
        brew install binwalk
        brew install cifer
        brew install dex2jar
        brew install dns2tcp
        brew install fcrackzip
        brew install foremost
        brew install hashpump
        brew install hydra
        brew install john
        brew install knock
        brew install nmap
        brew install pngcheck
        brew install socat
        brew install sqlmap
        brew install tcpflow
        brew install tcpreplay
        brew install tcptrace
        brew install ucspi-tcp # `tcpserver` etc.
        brew install xz

        # Install other useful binaries.
        brew install ack
        #brew install exiv2
        brew install git
        #brew install imagemagick --with-webp
        brew install lua
        brew install lynx
        brew install p7zip
        brew install pigz

        # Install Node.js. Note: this installs `npm` too, using the recommended
        # installation method.
        brew install node

        # Remove outdated versions from the cellar.
        brew cleanup
}

function build_libimobiledevice(){
        if [[ $(uname) == 'Darwin' ]]; then
                brew link openssl --force
        fi
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
        }

        buildlibs
        sudo ldconfig
}

if [[ $(uname) == 'Linux' ]]; then
        depends
elif [[ $(uname) == 'Darwin' ]]; then
        brew_install
fi
build_libimobiledevice
echo -e "\031[1;37mLibimobiledevice library build script - Elrhk 2015"
main
