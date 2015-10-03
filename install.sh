#!/bin/bash
#
# Install mesos and dependencies
#

set -e

apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
echo "deb http://repos.mesosphere.com/debian jessie main" > \
    /etc/apt/sources.list.d/mesosphere.list

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    mesos \
    wget \
    ca-certificates

wget -q https://github.com/Yelp/dumb-init/releases/download/v0.5.0/dumb-init_0.5.0_amd64.deb
dpkg -i dumb-init_*.deb
