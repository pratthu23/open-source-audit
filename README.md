# Open Source Audit

A collection of Bash scripts for auditing and exploring open-source software and system components on Kali Linux.

## Author
Pratham  
Course: Open Source Software

## Scripts Overview

### script1.sh: System Identity Report
Displays essential system information including:
- Distribution name
- Kernel version
- Current user
- Home directory
- System uptime
- Current date
- License information

**Usage:** `./script1.sh`

### script2.sh: FOSS Package Inspector
Checks if a specified package is installed using dpkg and provides package details along with a philosophical note about the software.

**Default package:** python3  
**Usage:** `./script2.sh` (or modify the PACKAGE variable for different software)

### script3.sh: Disk and Permission Auditor
Audits critical system directories for:
- Directory permissions
- Owner and group information
- Disk usage size

**Audited directories:** /etc, /var/log, /home, /usr/bin, /tmp  
**Additional check:** Python configuration directory (/etc/python3)

**Usage:** `./script3.sh`

### script4.sh: Log File Analyzer
Scans a specified log file for a keyword and provides:
- Count of matching lines
- Last 5 matching lines

**Default keyword:** "error"  
**Usage:** `sudo ./script4.sh /var/log/syslog "error"`  
*(Requires sudo for system log access)*

### script5.sh: Open Source Manifesto Generator
Interactively generates a personalized open-source manifesto based on user responses to three questions:
1. Favorite open-source tool
2. Meaning of "freedom"
3. Something to build and share

**Output:** Saves manifesto to `manifesto_[username].txt`  
**Usage:** `./script5.sh`

## Requirements
- Kali Linux (or Debian-based system with dpkg)
- Bash shell
- Standard Unix tools (grep, awk, du, ls, etc.)
- Sudo access for log file analysis (script4.sh)

## License
This project is distributed under the GNU General Public License (GPL), following the spirit of open-source software.