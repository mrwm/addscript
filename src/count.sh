#!/bin/bash
# A script that counts non-stop and writes the output into a file. Thus maxing out the (CPU and) storage space.

# Copy the line below for a single command to enter into terminal.
#cd $HOME/Desktop/ ; while true; do  echo $(( $( cat output.log | tail -n 1 ) + 1 )) >> output.log ; sleep 0.5 ; done &  disown ; exit

### START ###

# Variables:
  ### `read -p "..." $VAR` asks the user for an input.
read -p "Enter desired number of delay from 0.1 to 1 second(s):" Delay
read -p "Enter the desired name of output file:" Name
read -p "Do you want it hidden? [y/n]:" Hide
## Variable names are usually placed at the end of the `read` command
 
# Variables without prompt:
TargetDir=$HOME/Desktop/ #Dir. whrere we want the file to be in.
Command=$(( $( cat $Name | tail -n 2 | head -n 1) + 1 ))
 # ^^ Read the last line of the file. Then add one to the number.

# Check if user wants the file hidden. Default=Y
if [ $Hide = 'n' ] || [ $Hide = 'N' ]; then
  echo "Ok."
else
  echo "Hidden!"
  Name=.$Name
fi

cd $TargetDir  # Go to the directory specified on line 16.
touch $Name    # Create the file specified on line 12.

# The loop:
while true; do
echo $Command >> $Name # Write number on last line of the file.
sleep $Delay           # Delay for the amount specified on line 11.
done &                 # End while loop in background w/ '&'.
disown                 # You do not want the task to close when you exit so you 'disown' the task.

### END ###
exit 0  # Exit without errors
