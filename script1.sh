#!/bin/bash
#Script 1: System Identity Report
#Author: Pratham
#Course: Open Source Software

#--- Variables
STUDENT_NAME="Pratham"
SOFTWARE_CHOICE="Python"

# System info
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)

# Completing the TODO variables
DISTRO=$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f 2)
CURRENT_DATE=$(date)
HOME_DIR=$HOME
LICENSE_MSG="Kali Linux is primarily distributed under the GNU General Public License (GPL)."

# --- Display
echo "=================================="
echo "       Open Source Audit          "
echo "=================================="
echo "Student: $STUDENT_NAME"
echo "Software: $SOFTWARE_CHOICE"
echo "----------------------------------"
echo "Distro : $DISTRO"
echo "Kernel : $KERNEL"
echo "User   : $USER_NAME"
echo "Home   : $HOME_DIR"
echo "Uptime : $UPTIME"
echo "Date   : $CURRENT_DATE"
echo "License: $LICENSE_MSG"
