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

webdrivermanager firefox chrome --linkpath /usr/local/bin


##### SELENIUM #####

# SELENIUM_PACKAGES="unzip xvfb libxi6 libgconf-2-4"
#
# sudo apt-get install -y $SELENIUM_PACKAGES


##### CHROMEDRIVER #####