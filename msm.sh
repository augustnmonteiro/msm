#!/bin/sh

#
# MSM - Mycroft Skill Manager
#

# -------------- Configuration

mycroft_skill_folder="/opt/mycroft/skills"
mycroft_virtualenv=~/.virtualenvs/mycroft/bin/activate

# -------------- Functions

function msm_help() {
    echo
    echo "1) help to see this menu"
    echo "2) install <repository> to add a new skill"
    echo
}

function msm_install() {
    current=`pwd`
    git_name=`echo "$2" | sed 's/.*\///'`
    name=`echo "$git_name" | sed 's/.git//'`
    cd $mycroft_skill_folder

    echo "Cloning repository"
    git clone $2 >> /dev/null
    cd $name

    echo "Sourcing env"
    source $mycroft_virtualenv

    echo "Installing OS requirements"
    source requirements.sh

    if [ -f "requirements.txt" ]; then
        echo "Installing libraries requirements"
        pip install -r requirements.txt
    fi

    cd $current

    echo -e "\nPlease restart your Mycroft :D\n"
}

function msm_run() {
    echo -e "#######  Mycroft Skill Manager #######\n"

    if [ "$1" = "install" ]; then
        msm_install $*
    else
        msm_help
    fi
}

# -------------- Running

msm_run $*