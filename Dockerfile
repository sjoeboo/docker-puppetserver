FROM centos:7

MAINTAINER Matthew Nicholson <sjoeboo@sjoeboo.com>

RUN rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm

RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install puppetserver  && \
    yum clean all && rm -rf /var/cache/yum/


CMD ['/opt/puppetlabs/bin/puppetserver', 'foreground']
