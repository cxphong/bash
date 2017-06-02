mode=`iwconfig wlan0 | grep 'Mode' | awk -F' ' '{print $1;}' | awk -F':' '{print $2;}'`

if [ "$mode" == "Managed" ]; then
        essid=`iwconfig wlan0 | grep 'ESSID:' | awk -F' ' '{print $4;}' | awk -F':' '{print $2;}'`

        if [ -z "$essid" ]; then
                echo "Not connected. Start startHostSpot"
                #/home/pi/nhvcam_raspberry/startHostSpot.sh
        else
                echo SSID $essid
        fi

        ip=`ip addr show wlan0 | grep -Po 'inet \K[\d.]+'`

        if [ -z "$ip" ]; then
        	echo "No ip address";
        	#/home/pi/nhvcam_raspberry/startHostSpot.sh
        else
        	echo ip $ip
        fi
else
        echo "AP"


fi