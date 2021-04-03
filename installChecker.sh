#!/bin/bash
echo "Installing..."
wget -O /root/xdermChecker.py https://raw.githubusercontent.com/kufhed/xderm-checker/main/xdermChecker.py -q
#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "*/5 * * * * /usr/bin/python3 /root/xdermChecker.py" >> mycron
#install new cron file
crontab mycron
/etc/init.d/cron restart
rm mycron
