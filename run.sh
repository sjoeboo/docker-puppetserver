#!/bin/bash
#Script to RUN puppet server
#before running, change some configs based on ENV passed in

#Set JAVA_ARGS as passed in
sed -i "s/JAVA_ARGS=.*/JAVA_ARGS=\"${JAVA_ARGS}\"/g" /etc/sysconfig/puppetserver

#If needed, toggle CA functionality off, otherwise leave default of ON.

if [ $PUPPET_CA != 'true' ]; 
then 
  sed -i 's/puppetlabs.services.ca.certificate-authority-service\/certificate-authority-service/#puppetlabs.services.ca.certificate-authority-service\/certificate-authority-service/g' /etc/puppetlabs/puppetserver/bootstrap.cfg;
fi


if [ $PUPPET_CA != 'true' ]; 
then 
  sed -i 's/#puppetlabs.services.ca.certificate-authority-disabled-service\/certificate-authority-disabled-service/puppetlabs.services.ca.certificate-authority-disabled-service\/certificate-authority-disabled-service/g' /etc/puppetlabs/puppetserver/bootstrap.cfg;
fi

/opt/puppetlabs/bin/puppetserver forground 

