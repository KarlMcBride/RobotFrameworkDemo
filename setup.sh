#!/bin/bash

# For jenkins, ensure that the following path is owned by jenkins

echo "$(whoami)"

sudo apt-get install -y python3-pip

# Use below for installing RF for Jenkins - robot command not found if not using sudo -H
if [ $JENKINS_HOME ]; then
    # Install for Jenkins
    sudo -H pip3 install robotframework robotframework-sshlibrary
else
    # Install for local user
    pip3 install --user robotframework robotframework-sshlibrary
fi;