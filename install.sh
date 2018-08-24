#!/bin/bash
#
#

if [ $(id -u) != 0 ]; then
  echo "This installer requires root permissions."
  sudo "$0" "$@"
  exit
fi

echo "Installing Package Dependencies ..."
yum install -y mysql-server python MySQL-python

echo "Installing script to /sbin ..."
cp freesmdr.py /sbin/freesmdr.py

echo "Copying Config file to /etc/freesmdr.conf ..."
if [ ! -f /etc/freesmdr.conf ]; then 
  cp freesmdr.conf.dist /etc/freesmdr.conf
fi

echo "Creating Log File Directory ..."
mkdir  -p /var/log/freesmdr
touch /var/log/freesmdr/freesmdr.log
touch /var/log/freesmdr/freesmdr.info

echo "Installing Service Files ..."
cp freesmdr.service /etc/systemd/system/freesmdr.service
systemctl daemon-reload
 
echo "Fixing Permissions ..."
chown root.root /sbin/freesmdr.py
chown root.root /etc/systemd/system/freesmdr.service
chown root.root /etc/freesmdr.conf
chown -R root.root /var/log/freesmdr/
chmod 777 /sbin/freesmdr.py
chmod 755 /etc/systemd/system/freesmdr.service
chmod 644 /etc/freesmdr.conf
chmod 755 -R /var/log/freesmdr/
echo ""
echo ""
echo "FreeSMDR should be installed now"
echo "Make sure you source the freesmdr.sql file into your Mysql Database"
echo "Configure by editing the config file at /etc/freesmdr.conf"
echo "Once configured, start the service with 'systemctl start freesmdr'"
echo "Don't forget to enable the service with 'systemctl enable freesmdr' so it will start on boot"
exit 0
