#!/bin/sh

if [ -n "$1" ]
# If command-line argument is present (non-empty), do the following.
then
  filename=$1 # The filename you enter is saved as variable "filename" 
else  
# If command-line argument is not present (empty), do the following.
  echo "Enter filename you wish to place in template"
  read filename 
fi  

cp $filename inputCopy.txt # Makes a copy of input file and names it inputCopy.txt

i=1 # Sets i to 1
text=$(sed -n ''$i'{p;q}' Unwanted_Strings.txt) # Sets text to the first string in the Unwanted_Strings.txt file 
	
until [ "$text" = "" ] # When this condition is met the loop has reached the end of the Unwanted_Strings.txt file and the loop exits
  do	 
    eval 'sed '$text'' # Sed removes lines containing the variable $text from inputCopy.txt, and saves this in tempfile.txt or tempfile.txt?
      if [ -e "tempfile.txt" ] # If the file tempfile.txt is present
      then
        mv tempfile.txt inputCopy.txt # Overrides inputCopy.txt with tempfile.txt
      else # The file tempfile.txt? will be present if tempfile.txt is not.
	    mv tempfile.txt? inputCopy.txt # Overrides inputCopy.txt with tempfile.txt?
      fi             
   i=$(($i+1)) # increments i by 1
   text=$(sed -n ''$i'{p;q}' Unwanted_Strings.txt)  # Sets text to the next string in the list in Unwanted_Strings.txt
done	
cp whitepaper.tex whitepaper.txt # Converting whitepaper.tex to whitepaper.txt
# Now must add remaining text to Template
line_Num=$(wc -l < inputCopy.txt) # Number of lines in the inputCopy.txt file
#string="T" # String at the point whare which we want to add text directly below
while [ $line_Num -gt 0 ]
  do 
  
  text=$(sed -n ''$line_Num'{p;q}' inputCopy.txt) # inputcopy.txt line pos being set to text
# text="tes"
	echo $line_Num
	
# Places text below \input{template/title} in whitepaper template
sed "
/[\*]input{template\/title}/ a\
 ${text}
" whitepaper.txt > tempfile.txt

  mv tempfile.txt whitepaper.txt
  
line_Num=$(($line_Num-1))

done

# Remove the inputCopy.txt file
rm inputCopy.txt

# Move whitepaper.txt to outputFile.tex
mv whitepaper.txt outputFile.tex






exit