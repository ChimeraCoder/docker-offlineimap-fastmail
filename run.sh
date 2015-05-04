#! /bin/sh

# This is in a separate file to allow injection of environment variables at runtime

sed -i "s/remoteuser = YOUR_EMAIL_ADDRESS@fastmail.com/remoteuser = $EMAIL/" /home/offlineimap/.offlineimaprc
sed -i "s/remotepass = YOUR_PASSWORD_HERE/remotepass = $PASSWORD/" /home/offlineimap/.offlineimaprc

exec offlineimap -c /home/offlineimap/.offlineimaprc
