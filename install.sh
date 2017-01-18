#!/bin/sh

#
# MSM - Mycroft Skill Manager
#

echo -e "Installing OS requirements\n"
source requirements.sh

echo -e "Installing MSM\n"
sudo cp msm.sh /usr/bin/msm