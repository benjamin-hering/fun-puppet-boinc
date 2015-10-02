!#/bin/bash
ntpdate pool.ntp.org
apt-get install git -y
apt-get install ntp -y
mkdir -p /etc/puppet/
cd /etc/puppet/
git init
git remote add origin https://github.com/benjamin-hering/fun-puppet-boinc.git
git fetch
git checkout -t origin/master
#git clone https://github.com/benjamin-hering/fun-puppet-boinc.git
rm -rf /var/lib/puppet/ssl
