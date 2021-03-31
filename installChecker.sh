#!/bin/bash
echo "Installing..."
url = "https://raw.githubusercontent.com/kufhed/xderm-checker/main"
wget -O /www/xderm/xdermChecker.py $url/xdermChecker.py -q
#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "* * * * * /usr/bin/python3 /root/xdermChecker.py" >> mycron
#install new cron file
crontab mycron
/etc/init.d/cron restart
rm mycron