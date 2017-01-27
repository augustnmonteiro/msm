#!/bin/bash
# @author Augusto Monteiro

mycroft_skill_folder="/opt/mycroft/skills"

echo "#######  Mycroft Skill Manager #######"

function help() {
    echo ""
    echo "1) help to see this menu"
    echo "2) install <repository> to add a new skill"
    echo ""
}

function install() {
    current=`pwd`
    git_name=`echo "$2" | sed 's/.*\///'`
    name=`echo "$git_name" | sed 's/.git//'`
    cd $mycroft_skill_folder
    echo "Cloning repository"
    git clone $2 >> /dev/null
    cd $name
    if [ -f "requirements.sh" ]; then
        echo "Installing os requirements"
        ./requirements.sh
    fi
    if [ -f "requirements.txt" ]; then
        echo "Installing libraries requirements"
        pip install -r requirements.txt
    fi
    sudo service mycroft-skills restart
    echo "Skill installed!"
    say "Skill $name installed!"

}

# params: test command, apt name
function test_and_install() {
    eval $1 > /dev/null 2>&1
    if [[ $? != 0 ]]; then
        sudo apt-get -y install $2
    fi
}

function install_dependencies() {
    test_and_install "git --version" "git"
    test_and_install "pip --version" "python-pip"
}

if [ -f ~/.msm ]; then
    source ~/.msm
fi
if [ -z $MSM_DEPENDENCIES ]; then
    install_dependencies
    echo 'MSM_DEPENDENCIES=1' >> ~/.msm
fi

if [ "$1" = "install" ]; then
    install $*
else
    help
fi
