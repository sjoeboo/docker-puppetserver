# docker-puppetserver
puppetserver 2.x docker container


Expects 2 mounts:

/etc/puppetlabs/puppet/:
 A dir containing your puppet.conf, autosign.conf, auth.conf, etc etc. 

/etc/puppetlabs/code:
 A dir containing your puppet codebase, modules/ hiera.yaml, environments/(built with r10k?)

/etc/puppetlabs/puppetserver:
 A dir for all the puppetserver configs

Environmental Variables:

```JAVA_ARGS=<JAVA ARGS>```
 (default leaves pupperserver defaults)

Install gems into puppetserver at container runtime. 
```GEMS="hipchat hiera-eyaml" (default is none)```
