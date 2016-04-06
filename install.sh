#!/bin/bash

OSIAM_VERSION=2.5
OSIAM_DOWNLOAD_URL=https://github.com/osiam/osiam/releases/download/v${OSIAM_VERSION}/

wget -O auth-server-${OSIAM_VERSION}-distribution.tar.gz ${OSIAM_DOWNLOAD_URL}auth-server-${OSIAM_VERSION}-distribution.tar.gz
wget -O resource-server-${OSIAM_VERSION}-distribution.tar.gz ${OSIAM_DOWNLOAD_URL}resource-server-${OSIAM_VERSION}-distribution.tar.gz

# auth-server
tar xfz auth-server-${OSIAM_VERSION}-distribution.tar.gz
mv auth-server-${OSIAM_VERSION}/osiam-auth-server.war webapps
cp -r auth-server-${OSIAM_VERSION}/configuration/* /etc/osiam
sed -i -e 's#localhost:5432#postgresql:5432#' /etc/osiam/auth-server.properties

# resource-server
tar xfz resource-server-${OSIAM_VERSION}-distribution.tar.gz
mv resource-server-${OSIAM_VERSION}/osiam-resource-server.war webapps
cp -r resource-server-${OSIAM_VERSION}/configuration/* /etc/osiam
sed -i -e 's#localhost:5432#postgresql:5432#' /etc/osiam/resource-server.properties

# cleanup
rm -rf auth-server-${OSIAM_VERSION}-distribution.tar.gz auth-server-${OSIAM_VERSION}
rm -rf resource-server-${OSIAM_VERSION}-distribution.tar.gz resource-server-${OSIAM_VERSION}
rm -rf webapps/docs
rm -rf webapps/examples
rm -rf webapps/host-manager
rm -rf webapps/manager
