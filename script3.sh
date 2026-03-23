#!/bin/bash
# Script 3: Disk and Permission Auditor

# Purpose: Loops through critical system directories to report their size, owner, and permissions.

# Initialize an array containing the paths of the directories we want to audit
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

# Print the header for our output report
echo "Directory Audit Report"
echo "======================"

# Start a for-loop to iterate through every item in the DIRS array
for DIR in "${DIRS[@]}"; do
    
    # Check if the current path actually exists and is a directory (-d)
    if [ -d "$DIR" ]; then
        
        # Run 'ls -ld' to get directory details. 
        # Pipe the output to 'awk' to extract specific columns: 
        # $1 = Permissions, $3 = Owner, $4 = Group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        
        # Run 'du -sh' to calculate human-readable disk usage.
        # '2>/dev/null' redirects and hides any "Permission denied" error messages.
        # Pipe to 'cut -f1' to grab only the file size (the first field).
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        # Print the extracted variables in a clean format
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        # If the directory is not found, alert the user
        echo "$DIR does not exist on this system"
    fi
    
# End of the for-loop
done

# Print a separator line for the specific software check
echo "======================"

# --- FOSS Software Specific Audit ---
# Define the configuration directory for our chosen software (Python)
SOFTWARE_CONFIG_DIR="/etc/python3"

echo "Checking Python Configuration Directory..."

# Check if the Python configuration directory exists
if [ -d "$SOFTWARE_CONFIG_DIR" ]; then
    
    # Extract the permissions, owner, and group using ls -ld and awk
    SOFT_PERMS=$(ls -ld "$SOFTWARE_CONFIG_DIR" | awk '{print $1, $3, $4}')
    
    # Print the specific permissions for Python's directory
    echo "$SOFTWARE_CONFIG_DIR => Permissions: $SOFT_PERMS"
else
    # Alert if Python's configuration directory is not present
    echo "$SOFTWARE_CONFIG_DIR does not exist on this system"
fi