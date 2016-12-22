#!/bin/bash
# @author Augusto Monteiro

mycroft_skill_folder="/opt/mycroft/skills"
mycroft_virtualenv=~/.virtualenvs/mycroft/bin/activate

echo "#######  Mycroft Skill Manager #######"

function help {
	echo ""
	echo "1) help to see this menu"
	echo "2) install <repository> to add a new skill"
	echo ""
}

function install {
	current=`pwd`
	git_name=`echo "$2" | sed 's/.*\///'`
	name=`echo "$git_name" | sed 's/.git//'`
        cd $mycroft_skill_folder
	echo "Cloning repository"
        git clone $2 >> /dev/null
        cd $name
	echo "Sourcing env"
        source	$mycroft_virtualenv 
        if [ -f "requirements.sh" ]; then
		echo "Installing os requirements"
        	./requirements.sh
        fi
        if [ -f "requirements.txt" ]; then
		echo "Installing libraries requirements"
        	pip install -r requirements.txt
        fi 
        echo "Please restart you mycroft : D"
		
}

if [ "$1" = "install" ]; then
  install $*
else
  help
fi
