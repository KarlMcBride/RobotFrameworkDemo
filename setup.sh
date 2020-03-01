#!/bin/bash

# For jenkins, ensure that the following path is owned by jenkins

echo "$(whoami)"

sudo apt-get install -y python3-pip

ROBOT_PACKAGES="robotframework robotframework-sshlibrary robotframework-selenium2library"
SELENIUM_PACKAGES="webdrivermanager"

# Use below for installing RF for Jenkins - robot command not found if not using sudo -H
if [ $JENKINS_HOME ]; then
    # Install for Jenkins
    sudo -H pip3 install $ROBOT_PACKAGES $SELENIUM_PACKAGES
else
    # Install for local user
    pip3 install --user $ROBOT_PACKAGES $SELENIUM_PACKAGES
fi

#sudo webdrivermanager firefox chrome --linkpath /usr/local/bin

INSTALL_DIR="/usr/local/bin"

json=$(curl -s https://api.github.com/repos/mozilla/geckodriver/releases/latest)
url=$(echo "$json" | jq -r '.assets[].browser_download_url | select(contains("linux64"))')
curl -s -L "$url" | tar -xz
chmod +x geckodriver
sudo mv geckodriver "$INSTALL_DIR"
echo "installed geckodriver binary in $INSTALL_DIR"