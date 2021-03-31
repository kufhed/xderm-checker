#!/bin/bash
#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "* * * * * /usr/bin/python3 /root/xdermChecker.py" >> mycron
#install new cron file
crontab mycron
rm mycron