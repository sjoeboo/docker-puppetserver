# docker-puppetserver
puppetserver 2.x docker container


Expects 2 mounts:

/etc/puppetlabs/puppet/:
 A dir containing your puppet.conf, autosign.conf, auth.conf, etc etc. 

/etc/puppetlabs/code:
 A dir containing your puppet codebase, modules/ hiera.yaml, environments/(built with r10k?)


