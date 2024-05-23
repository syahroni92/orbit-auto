#!/bin/ash
# Installation script by ARYO.

DIR=/usr/bin

install_update(){
echo "Update and install prerequisites"
clear
opkg update
sleep 1
clear
opkg install python3-pip
sleep 1
clear
pip3 install requests
sleep 1
clear
pip3 install huawei-lte-api
sleep 1
}

finish(){
	clear
	echo ""
    echo "INSTALL SUCCESSFULLY ;)"
#    echo "There are 2 important steps to finish this setup:"
#    echo ""
#    echo "1. Make sure this line is in the cron. To open the cron editor, run: crontab -e"
#    echo "   */2 * * * * $DIR/wwan-keep-alive.sh"
#    echo ""  
#    echo "2. The interface representing the LTE connection is set to 'wwan0'."
#    echo "   To change the interface, please edit the line INTERFACE='wwan0' in the 'restart-interface.sh'."
    echo "Please Configuration Conn Monitor (firmware reyre)"
    echo ""
    echo ""
	echo ""
    echo ""
    echo ""
}

download_files()
{
	clear
  	echo "Downloading files from repo..."
   	rm -f $DIR/mbit && wget -O $DIR/mbit https://raw.githubusercontent.com/syahroni92/orbit-auto/main/usr/bin/mbit && chmod +x $DIR/mbit
 	rm -f $DIR/orbit.py && wget -O $DIR/orbit.py https://raw.githubusercontent.com/syahroni92/orbit-auto/main/usr/bin/orbit.py && chmod +x $DIR/orbit.py
    	finish
}

echo ""
echo "Instal prerequisites."
while true; do
    read -p "Do you want to continue cok (y/n)? " yn
    case $yn in
        [Yy]* ) install_update; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer 'y' or 'n'.";;
    esac
done

echo ""

while true; do
    read -p "This will download the files into $DIR. Do you want to continue (y/n)? " yn
    case $yn in
        [Yy]* ) download_files; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer 'y' or 'n'.";;
    esac
done
