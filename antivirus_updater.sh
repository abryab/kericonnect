#!/bin/bash

echo "Created by Mojtaba from Iran => erfan.webdev@gmail.com <="

dir="/opt/kerio/mailserver/bitdefender"
update_dir="/opt/kerio/mailserver/UpdateBit"
cumulative_zip="cumulative.zip"
cumulative_url="http://download.bitdefender.com/updates/update_av64bit/$cumulative_zip"

echo "******Deleting Previous Bit Defender Update File******"
rm -rf $update_dir/cumula*.*

echo "******Downloading Bit Defender Update******"
wget $cumulative_url -P $update_dir

echo "******Stopping Kerio Connect******"
systemctl stop kerio-connect.service

echo "******Deleting all files from $dir******"
rm -rf $dir/*
echo "******Folder deleted.******"
echo "******Kerio Connect Antivirus Update******"
unzip "$update_dir/$cumulative_zip" -d "$dir/1"
ln -s /opt/kerio/mailserver/bitdefender/1/bdcore.so.linux-x86_64 /opt/kerio/mailserver/bitdefender/1/bdcore.so
echo "******Starting Kerio Connect. Please wait 30 seconds.******"
systemctl start kerio-connect.service
