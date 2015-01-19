VERT="\\033[1;32m" NORMAL="\\033[0;39m" ROUGE="\\033[1;31m" ROSE="\\033[1;35m" BLEU="\\033[1;34m" BLANC="\\033[0;02m" BLANCLAIR="\\033[1;08m" JAUNE="\\033[1;33m" CYAN="\\033[1;36m" echo "" echo -e "$VERT" " ------------------ ""$ROUGE""Y o u W i l l B e C o l o r e d ""$VERT"" ------------ " "$NORMAL" echo " | Color bash script | " echo -e " | written by""$VERT" "selim,b." "$CYAN""(s.bouras@free.fr) " "$NORMAL" " | " echo -e " | This script is""$BLEU"" free Licence""$NORMAL"" | " echo -e "$VERT" " -------------------------------------------------------------------- " "$NORMAL" echo -e " $BLEU" " Ok!!..Dear ... Your bash is colored .. Have Fun!!.."

Apt-get script.sh

Main article: Aptitude

I always run this script right after installing Ubuntu Linux (or Debian, if I used it).

It installs a bunch of useful stuff for building software from source.

#!/bin/sh
 
sudo apt-get install -y build-essential
sudo apt-get install -y make
sudo apt-get install -y m4
sudo apt-get install -y bison
sudo apt-get install -y flex
sudo apt-get install -y tar
sudo apt-get install -y perl
sudo apt-get install -y binutils
sudo apt-get install -y gcc
sudo apt-get install -y libstdc++6-dev
sudo apt-get install -y libc6-dev
sudo apt-get install -y gcc4.2
sudo apt-get install -y g++
sudo apt-get install -yf g77
sudo apt-get install -yf gfortran
sudo apt-get install -yf gnuplot
sudo apt-get install -yf octave
sudo apt-get install -y lynx
sudo apt-get install -y tetex-base tetex-bin tetex-extra
sudo apt-get install -y sed
sudo apt-get install -y awk
 
sudo apt-get install -y libgfortran1
sudo apt-get install -y libgfortran2
sudo apt-get install -y libgfortran
sudo apt-get install -y libgcc1
 
sudo apt-get install -y subversion
sudo apt-get install -y python-2.7
sudo apt-get install -y python2.7-numpy
sudo apt-get install -y python2.7-scipy
sudo apt-get install -y ipython
sudo apt-get install -y firefox-3.0
sudo apt-get install -y mozilla-firefox-adblock
 
sudo apt-get install -y lyx
 
sudo apt-get install -y libncurses4 
sudo apt-get install -y libncurses5 
sudo apt-get install -y ncurses-base

Categories: Scripts | Unix

 

 

 
All material © 2007-2015, Charles Reid.

 

 
