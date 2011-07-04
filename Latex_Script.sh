#!/bin/sh

if [ -n "$1" ]
# If command-line argument is present (non-empty), do the following.
then
  inarg=$1 # The filename you enter is saved as variable "inarg"
  filename=$inarg
else  
# If command-line argument is not present (empty), do the following.
  echo "Enter filename you wish to place in template"
  read filename 
 # inarg=$filename # The filename you enter is saved as variable "inarg"
fi  

cp $filename inputCopy.txt # Makes a copy of input file and names it inputCopy.txt

i=1 # Sets i to 1
	  text=$(sed -n ''$i'{p;q}' Unwanted_Strings.txt) # Sets text to the first string in the Unwanted_Strings.txt file 
	
	     until [ "$text" = "" ] # When this condition is met the loop has reached the end of the Unwanted_Strings.txt file and the loop exits
           do	 
             eval 'sed '$text''
			   if [ -e "tempfile.txt" ]
			     then
                 mv tempfile.txt inputCopy.txt 
                 else
				 mv tempfile.txt? inputCopy.txt 
               fi             
	         i=$(($i+1)) # increments i by 1
		     text=$(sed -n ''$i'{p;q}' Unwanted_Strings.txt)  # Sets text to the next string in the list in Unwanted_Strings.txt
         done	
		 
exit