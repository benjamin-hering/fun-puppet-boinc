!#/bin/bash
# starting setup
ntpdate pool.ntp.org
apt-get update
apt-get install git ntp -y

# Clones this repo into puppet config director
mkdir -p /etc/puppet/
cd /etc/puppet/
git init
git remote add origin https://github.com/benjamin-hering/fun-puppet-boinc.git
git fetch
git checkout -t origin/master
#git clone https://github.com/benjamin-hering/fun-puppet-boinc.git
# Seting up the initial puppet.conf
cat << EOF
[main]
logdir=/var/log/puppet
vardir=/var/lib/puppet
ssldir=/var/lib/puppet/ssl
rundir=/var/run/puppet
factpath=$vardir/lib/facter
templatedir=$confdir/templates
prerun_command=/etc/puppet/etckeeper-commit-pre
postrun_command=/etc/puppet/etckeeper-commit-post
dns_alt_name=$(hostname) $(hostname -f) puppet
confdir = /etc/puppet
manifest = $confdir/manifests

[master]
# These are needed when the puppetmaster is run by passenger
# and can safely be removed if webrick is used.
ssl_client_header = SSL_CLIENT_S_DN
ssl_client_verify_header = SSL_CLIENT_VERIFY

EOF 
> /etc/puppet.conf
 
puppet cert --generate $(hostname -f)
puppet agent -t
