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

cp $inarg inputCopy.txt # Makes a copy of input file and names it inputCopy.txt

i=1 # Sets i to 1


	 # text=$(sed -e ''$i'{p;q}' Unwanted_Strings.txt) # Sets text to the first string in the Unwanted_Strings.txt file

	  
	  #text2=$(sed -n '/[$i]/p' Unwanted_Strings.txt)

	  
	 #text="$(head -n $i Unwanted_Strings.txt)"
	  
	 # sed "/$text/ s|$| end|"
	  
	  text1=$(grep ':' Unwanted_Strings.txt |-n1 -n2)
	 
	  
	 echo "${text}" 
		  
	     until [ "$text" = "" ] # When this condition is met the loop has reached the end of the Unwanted_Strings.txt file and the loop exits
         do
		 
		 
		
		 
		    #sed "/${text}/d" inputCopy.txt > tempfile.txt  # Removes lines containing the string $text from inputCopy.txt and moves it to tempfile.txt
		   # mv tempfile.txt inputCopy.txt # Overwrites inputCopy with tempfile which is a copy of inputCopy with a possible change made to it.                               
	       i=$(($i+1)) # increments i by 1
		   text=$(sed -n ''$i'{p;q}' Unwanted_Strings.txt) # Sets text to the next string in the list in Unwanted_Strings.txt
         done
exit