#!/bin/bash
# Script 4: Log File Analyzer
# Purpose: Scans a specified log file line-by-line for a keyword and prints a summary.
# Usage: sudo ./script4.sh /var/log/syslog "error"

# Assign the first command-line argument to the LOGFILE variable
LOGFILE=$1

# Assign the second argument to KEYWORD. If not provided, default to "error"
KEYWORD=${2:-"error"}

# Initialize the counter variable to 0
COUNT=0

# --- TODO Part 1: do-while style retry if the file is empty or not provided ---
# The -z checks if the string is empty. The ! -s checks if the file has zero size.
while [ -z "$LOGFILE" ] || [ ! -s "$LOGFILE" ]; do
    echo "Warning: No log file provided, or the specified file is empty."
    # Interactively prompt the user for a valid file path
    read -p "Please enter a valid log file path (e.g., /var/log/syslog): " LOGFILE
done

# Double-check that the file actually exists and is a regular file
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    # Exit the script with an error code
    exit 1
fi

echo "Analyzing $LOGFILE for the keyword '$KEYWORD'..."

# --- Main while-read loop ---
# IFS= prevents leading/trailing whitespace from being trimmed. 
# read -r prevents backslashes from acting as escape characters.
while IFS= read -r LINE; do
    
    # Check if the current line contains the keyword. 
    # grep -i makes it case-insensitive, -q makes it quiet (no output to screen).
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        
        # Increment the counter by 1 if a match is found
        COUNT=$((COUNT + 1))
    fi
    
# Feed the log file into the while loop
done < "$LOGFILE"

# Print the final summary count
echo "--------------------------------------------------"
echo "Result: Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo "--------------------------------------------------"

# --- TODO Part 2: Print the last 5 matching lines ---
echo "Last 5 matching lines:"

# Use grep to find all matching lines (case-insensitive), then pipe to tail to get the last 5
grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
echo "--------------------------------------------------"