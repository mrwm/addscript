#!/system/bin/sh
# A script that counts non-stop and writes the output into a file. Thus maxing out the (CPU and) storage space.

# Copy the line below for a single command to enter into terminal.
# cd ~/ ; while true; do  echo $(( $( cat output.log | tail -n 1 ) + 1 )) >> output.log ; sleep 0.5 ; done &  disown ; exit

### START ###

# Variables:
  ### `read -p "..." $VAR` asks the user for an input.
read -p "Enter desired number of delay from 0.1 to 1 second(s): " Delay
read -p "Enter the desired name of output file: " Name
read -p "Do you want it hidden? [Y/n]: " Hide

# Check if user wants the file hidden. Default=Y
if [ $Hide = 'n' ] || [ $Hide = 'N' ]; then
  :
else
  echo "Hidden!"
  Name=.$Name
fi

# Variables without prompt:
TargetDir=~/ # Dir. whrere we want the file to be in.

cd $TargetDir      # Go to the directory specified on line 16.
echo "1" > $Name   # Create the file specified on line 12.

# The loop:
while true; do
Command=$(( $( cat $Name | tail -n 1) + 1 ))
 # ^^ Read the last line of the file. Then add one to the number.

echo $Command >> $Name # Write number on last line of the file.
sleep $Delay           # Delay for the amount specified on line 11.
done &                 # End while loop in background w/ '&'.
disown                 # You do not want the task to close when you exit so you 'disown' the task.

# For testing
#cat $Name
#sleep 5
#cat $Name

### END ###
exit 0  # Exit without errors
