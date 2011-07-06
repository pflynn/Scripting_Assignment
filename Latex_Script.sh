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
pos=1; #Position of line being read in inputcopy.txt and being set to text
while [ $line_Num -gt 0 ]
  do 
  
  text=$(sed -n ''$pos'{p;q}' inputCopy.txt) # inputcopy.txt line pos being set to text
# text="tes"
	echo $line_Num
	#echo $text | 
  # sed '/^This.*/a\$text' whitepaper.txt > tempfile.txt''
  
 # awk 'NR=='40'{print $text; print;next}1' whitepaper.txt > tempfile.txt
 
 
 #awk '{print $text}'
  # sed -e '40 a\Add this line after 40th line'whitepaper.txt > tempfile.txt
  
  #cat -n inputCopy.txt
  
 # sed '40'"a $text"'' whitepaper.txt > tempfile.txt

#sed '$ 40 '"$text"'' whitepaper.txt > tempfile.txt

#string=$(sed -n ''$(($line_Num+40))'{p;q}' whitepaper.txt)

sed "
/\\input/ a\
 ${text}
" whitepaper.txt > tempfile.txt

  mv tempfile.txt whitepaper.txt
  
 

line_Num=$(($line_Num-1))
pos=$(($pos+1))


done



#text= head -$(wc -l < inputCopy.txt) inputCopy.txt # Saves the text from inputCopy.txt to variable text
#echo $text





exit