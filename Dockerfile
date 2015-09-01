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

ENV PUPPET_CA='true'

ENV GEMS="hipchat hiera-regex"

RUN chown puppet:puppet /var/run/puppetlabs

#Allow mounting in of puppetserver configs for performance tuning etc. 
VOLUME /etc/puppetlabs/puppetserver

#puppet.conf, autosign.conf, ssl.conf, auth.conf, etc etc.
VOLUME /etc/puppetlabs/puppet 

#environments/, modules/ hiera.yaml 
VOLUME /etc/puppetlabs/code


COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh
CMD /usr/local/bin/run.sh
