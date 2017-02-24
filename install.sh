#!/bin/bash

# USAGE
# wget https://raw.githubusercontent.com/lspg/saas-install-openproject/master/install.sh -O /tmp/install.sh && bash /tmp/install.sh

INSDIR='/root/install/openproject'

apt-get update && apt-get --yes upgrade
apt-get --yes install git

git clone https://github.com/lspg/saas-install-openproject.git ${INSDIR}

# Install Puppet
cd ${INSDIR}
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-jessie.deb
dpkg -i puppetlabs-release-pc1-jessie.deb && rm puppetlabs-release-pc1-jessie.deb
export PATH=$PATH:/opt/puppetlabs/bin
apt-key adv --recv-key --keyserver pgp.mit.edu EF8D349F
apt-get update && apt-get --yes install puppet librarian-puppet

# wget ...zip; unzip 
#wget --no-check-certificate https://github.com/lspg/puppet-installers/archive/master.zip -O openproject-puppet-installer.zip && unzip openproject-puppet-installer.zip && rm openproject-puppet-installer.zip

#librarian-puppet install --clean --verbose