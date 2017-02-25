#!/bin/bash

# USAGE
# wget https://raw.githubusercontent.com/lspg/saas-install-openproject/master/install.sh -O /tmp/install.sh && bash /tmp/install.sh

INSDIR='/root/install/openproject'

apt-get update && apt-get --yes upgrade
apt-get --yes install git

rm -Rf ${INSDIR}
git clone https://github.com/lspg/saas-install-openproject.git ${INSDIR}

# Install Puppet
cd ${INSDIR}
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-jessie.deb
dpkg -i puppetlabs-release-pc1-jessie.deb && rm puppetlabs-release-pc1-jessie.deb
export PATH=$PATH:/opt/puppetlabs/bin
apt-key adv --recv-key --keyserver pgp.mit.edu EF8D349F
apt-get update && apt-get --yes install puppet librarian-puppet

# Get puppet dependencies
librarian-puppet install --clean --verbose

# Start puppet install
puppet apply --modulepath=${INSDIR}/modules --verbose --debug ${INSDIR}/init.pp