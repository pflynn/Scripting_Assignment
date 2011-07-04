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


	 # text=$(sed -n ''$i'{p;q}' Unwanted_Strings.txt) # Sets text to the first string in the Unwanted_Strings.txt file 
	 # text=$(sed -n '/[$i]/p' Unwanted_Strings.txt)
	# text="$(head -n $i Unwanted_Strings.txt)"  
	 # sed "/$text/ s|$| end|"
	  
	 # text=\"/"$(grep ':' Unwanted_Strings.txt |head -n1)" 
	  
	
	##grep -v '^co$' inputCopy.txt >> inputCopy.txt
	
		
		
	
	 #echo $text
	#sed "/% coding: utf-8/d" inputCopy.txt > tempfile.txt
	 
		  
	 #    until [ "$text" = "" ] # When this condition is met the loop has reached the end of the Unwanted_Strings.txt file and the loop exits
     #   do
		 
		 
		 
	#	echo "$text"
		#sed -i "/$text/d" inputCopy.txt 
		
		#grep -Ev '$text|'
		
	#	eval "$text"
		
	#	cat inputCopy.txt | sed -i "$text"'d' > inputCopy.txt
		
		
		 # eval "sed $text" # creates tempfile.txt? file for some reason instead of tempfile.txt
		 # mv tempfile.txt? tempfile.txt # moves the tempfile.txt? to tempfile.txt
		  
		  #  sed "/${text}/d" inputCopy.txt > tempfile.txt  # Removes lines containing the string $text from inputCopy.txt and moves it to tempfile.txt
	#	    mv tempfile.txt inputCopy.txt # Overwrites inputCopy with tempfile which is a copy of inputCopy with a possible change made to it.                               
	 #     i=$(($i+1)) # increments i by 1
	#	  text=$(sed -n ''$i'{p;q}' Unwanted_Strings.txt)  # Sets text to the next string in the list in Unwanted_Strings.txt
      #   done
	 ./Remove_Unwanted_Strings.sh 
	  
exit