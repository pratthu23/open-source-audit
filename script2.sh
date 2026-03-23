#!/bin/bash
#Script 2: FOSS Package Inspector

# Change this to check different packages (e.g., python3, apache2, vlc, git)
PACKAGE="python3" 

# Check if package is installed (Using dpkg for Kali Linux)
if dpkg -s $PACKAGE &>/dev/null; then
    echo "$PACKAGE is installed."
    # dpkg -s fetches package details, grep filters for key info
    dpkg -s $PACKAGE | grep -E '^Version|^Status|^Description'
else
    echo "$PACKAGE is NOT installed."
fi

echo "---------------------------------------------------"

# Case statement that prints a one-line philosophy note based on package name
case $PACKAGE in
    apache2|httpd) 
        echo "Apache: the web server that built the open internet" 
        ;;
    mysql-server|mysql) 
        echo "MySQL: open source at the heart of millions of apps" 
        ;;
    python3) 
        echo "Python: A language shaped entirely by community" 
        ;;
    git) 
        echo "Git: The tool Linus built when proprietary failed him" 
        ;;
    vlc) 
        echo "VLC Media Player: Plays anything - built by students in Paris" 
        ;;
    *) 
        echo "$PACKAGE: An open-source tool empowering users with freedom." 
        ;;
esac
