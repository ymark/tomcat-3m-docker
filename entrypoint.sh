#!/bin/bash
#set -e

# catch missing password
if [ -z "$IP_ADDRESS" ]; then
echo "The parameter for setting the public IP is missing (IP_ADDRESS)"
echo "Setting the IP to localhost"
IP_ADDRESS="localhost"
else
# inject ip address
echo "injecting the IP adrress $IP_ADDRESS"
sed -i s/255.255.255.255/$IP_ADDRESS/g /usr/local/tomcat/webapps/3M/WEB-INF/web.xml
sed -i s/255.255.255.255/$IP_ADDRESS/g /usr/local/tomcat/webapps/3MEditor/WEB-INF/web.xml
sed -i s/255.255.255.255/$IP_ADDRESS/g /usr/local/tomcat/webapps/Maze/index.html
sed -i s/255.255.255.255/$IP_ADDRESS/g /usr/local/tomcat/webapps/Maze/errorpage.html
sed -i s/255.255.255.255/$IP_ADDRESS/g /usr/local/tomcat/webapps/Maze/multmappings.html
sed -i s/255.255.255.255/$IP_ADDRESS/g /usr/local/tomcat/webapps/Maze/singlemapping.html
sed -i s/255.255.255.255/$IP_ADDRESS/g /usr/local/tomcat/webapps/Maze/WEB-INF/config.properties
sed -i s/255.255.255.255/$IP_ADDRESS/g /usr/local/tomcat/webapps/Maze/app/js/Controller.js

fi

# Start tomcat
exec $CATALINA_HOME/bin/catalina.sh run
