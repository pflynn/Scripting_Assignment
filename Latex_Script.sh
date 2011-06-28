#!/bin/sh

if [ -n "$1" ]
# If command-line argument is present (non-empty), do the following.
then
  inarg=$1 # The filename you enter is saved as variable "inarg"
else  
# If command-line argument is not present (empty), do the following.
  echo "Enter filename you wish to place in template"
  read filename 
  inarg=$filename # The filename you enter is saved as variable "inarg"
fi  



i=1 # Sets i to 1
	  text=$(sed -n ''$i'{p;q}' Unwanted_Strings.txt) # Sets text to the first string in the Unwanted_Strings.txt file
	  	  
	    until [ "$text" = "" ] # When this condition is met the loop has reached the end of the Unwanted_Strings.txt file and the loop aborts
         do
         echo $text # Echos the string in Unwanted_Strings.txt at line $i
	     i=$(($i+1)) # increments i by 1
		 text=$(sed -n ''$i'{p;q}' Unwanted_Strings.txt) # Sets text to the next string in the list in Unwanted_Strings.txt
         done
exit