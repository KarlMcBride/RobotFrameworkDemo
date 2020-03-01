#!/bin/bash

# For jenkins, ensure that the following path is owned by jenkins

echo "$(whoami)"

sudo apt-get install -y python3-pip

ROBOT_PACKAGES="robotframework robotframework-sshlibrary robotframework-selenium2library"

# Use below for installing RF for Jenkins - robot command not found if not using sudo -H
if [ $JENKINS_HOME ]; then
    # Install for Jenkins
    sudo -H pip3 install $ROBOT_PACKAGES
else
    # Install for local user
    pip3 install --user $ROBOT_PACKAGES
fi


##### SELENIUM #####

SELENIUM_PACKAGES="unzip xvfb libxi6 libgconf-2-4"

sudo apt-get install -y $SELENIUM_PACKAGES


##### CHROMEDRIVER #####

pip3 install webdrivermanager
webdrivermanager firefox chrome --linkpath /usr/local/bin