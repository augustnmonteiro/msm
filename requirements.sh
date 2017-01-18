#!/bin/sh

#
# MSM - Mycroft Skill Manager
#
# This script install all OS dependencies of MSM.
#
# Dependencies at this moment: pip, git.

function install_pip() {
    if ! [ -x "$(command -v pip)" ]; then
        echo -e "Installing \"pip\"\n"
        curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | sudo python
        rm get-pip.py
    fi
}

function install_git() {
    if ! [ -x "$(command -v git)" ]; then
        echo -e "Installing \"git\"\n"
        sudo apt-get install git
    fi
}

function install_all() {
    install_pip
    install_git
}

install_all