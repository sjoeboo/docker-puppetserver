FROM centos:7

MAINTAINER Matthew Nicholson <sjoeboo@sjoeboo.com>

RUN rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm

RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install puppetserver  && \
    yum clean all && rm -rf /var/cache/yum/


EXPOSE 8140

#Configs



ENV JAVA_ARGS="-Xms256m -Xmx512m" \
    PATH=/opt/puppetlabs/bin/:$PATH

RUN sed -i "s/JAVA_ARGS=.*/JAVA_ARGS=\"${JAVA_ARGS}\"/g" /etc/sysconfig/puppetserver
RUN chown puppet:puppet /var/run/puppetlabs

#puppet.conf, autosign.conf, ssl.conf, auth.conf, etc etc.
VOLUME /etc/puppetlabs/puppet 

#environments/, modules/ hiera.yaml 
VOLUME /etc/puppetlabs/code


CMD ['/opt/puppetlabs/bin/puppetserver', 'foreground']
