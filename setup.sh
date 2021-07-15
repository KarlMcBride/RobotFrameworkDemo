#!/bin/sh

function install_robot_framework()
{
    # Use below for installing RF for Jenkins - robot command not found if not using sudo -H
    if [ $JENKINS_HOME ]; then
        # Install for Jenkins
        sudo -H pip3 install robotframework robotframework-sshlibrary
    else
        # Install for local user
        pip3 install --user robotframework robotframework-sshlibrary
    fi
}

function install_selenium_webdrivers()
{
    if ! geckodriver --version; then
        wget https://github.com/mozilla/geckodriver/releases/download/v0.29.1/geckodriver-v0.29.1-linux64.tar.gz
        tar -xvzf geckodriver*
        chmod +x geckodriver
        sudo mv geckodriver /usr/local/bin/
        rm geckodriver*
        echo -e "\nGeckodriver installed!"
    else
        echo -e "\nGeckodriver already installed, moving on."
    fi
}

# For jenkins, ensure that the following path is owned by jenkins

echo "$(whoami)"

sudo apt-get install -y python3-pip

install_robot_framework
install_selenium_webdrivers