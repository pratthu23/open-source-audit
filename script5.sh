#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Purpose: Interactively generates a personalized open-source manifesto and saves it to a text file.

# Print the welcome message for the user
echo "Answer three questions to generate your manifesto."
echo "--------------------------------------------------"

# Use 'read -p' to prompt the user and store their answers in variables 
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# Get the current date in "Day Month Year" format (e.g., 23 March 2026) 
DATE=$(date +'%d %B %Y')

# Define the output filename dynamically based on the current logged-in user
OUTPUT="manifesto_$(whoami).txt"

# --- Alias Concept Demonstration ---
# Requirement: Demonstrate the concept of aliases via a comment 
# In Linux, an alias is a custom shortcut for a command. We could create an alias 
# for this script by adding this line to our ~/.bashrc file:
# alias manifesto='./script5.sh'

# --- TODO: Compose paragraph and write to file ---
# Construct the manifesto string using the variables we collected
MANIFESTO="On $DATE, I declare my commitment to the open-source ecosystem. Every day, I rely on tools like $TOOL to learn, build, and grow. To me, open source is ultimately about $FREEDOM. By standing on the shoulders of giants, I hope to one day build and freely share $BUILD so that others may benefit, just as I have."

# Write the manifesto paragraph to the output file using the '>' operator 
echo "$MANIFESTO" > "$OUTPUT"

# Print a success message
echo "--------------------------------------------------"
echo "Manifesto successfully saved to $OUTPUT" [cite: 201]
echo "Here is what you wrote:"
echo "--------------------------------------------------"

# Display the contents of the newly created text file to the screen [cite: 202]
cat "$OUTPUT"
echo "--------------------------------------------------"