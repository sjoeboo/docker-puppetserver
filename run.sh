#!/bin/bash
#Script to RUN puppet server
#before running, change some configs based on ENV passed in

#Set JAVA_ARGS as passed in
sed -i "s/JAVA_ARGS=.*/JAVA_ARGS=\"${JAVA_ARGS}\"/g" /etc/sysconfig/puppetserver


#Install gems into the puppetserver as requestes
for g in $GEMS; do
  puppetserver gem install $g
done

/opt/puppetlabs/bin/puppetserver foreground 

