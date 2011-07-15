#!/bin/sh

# The tex file should be entered, not the asciidoc file.
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
# Now must pick out author names 
authors=$(cat inputCopy.txt | grep author{ | awk -F{ '{print $2}' |awk -F} '{print $1}')

title=$(cat inputCopy.txt | grep title{ | awk -F{ '{print $2}' |awk -F} '{print $1}')

date=$(cat inputCopy.txt | grep date{ | awk -F{ '{print $2}' |awk -F} '{print $1}')


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

sed -i 's/^\\/\\\\\\\\/g' inputCopy.txt # Adds extra backslash to start of lines that have one backslash at start, because it will get deleted later if just one
sed -i 's/^ \\/\\\\\\\\/g' inputCopy.txt # same with one space before backslash
while [ $line_Num -gt 0 ] # While variable line_Num is greater than 0
  do   
text=$(sed -n ''$line_Num'{p;q}' inputCopy.txt) # inputcopy.txt line pos being set to text

# Places text below \input{template/title} in whitepaper template (one line per itteration
sed "
/[\*]input{template\/title}/ a\
 ${text}
" whitepaper.txt > tempfile.txt
 mv tempfile.txt whitepaper.txt  # Moves tempfile.txt to whitepaper.txt on each itteration
line_Num=$(($line_Num-1)) # Decrements variable line_Num by one on each itteration
done
# Remove the inputCopy.txt file
rm inputCopy.txt
# Move whitepaper.txt to outputFile.tex
mv whitepaper.txt outputFile.tex

sed -i -f sedCommands.sed outputFile.tex # Execute substitute commands from sed file

sed -i "s/\\\\\\\\/\\\/g" outputFile.tex # Replaces all instances of \\ at start of lines with \ in outputFile.tex
#sed -i '/^\$/d' outputFile.tex # Removes all lines that are just \ from outputFile.tex # cant get 2 work yet

# Setting report details.
sed -i "s/{David Muldowney, Christopher Foley, Steven Davy}/{$authors}/g" outputFile.tex # Adding authors names to output file
sed -i "s/{Technical Report Name}/{$title}/g" outputFile.tex # Adding title to output file
sed -i "s/{21st May 2010}/{$date}/g" outputFile.tex # Adding date to output file
sed -i "s/ hyperlink{/ \\\hyperlink{/g" outputFile.tex # Adding date to output file

sed -i "s/biblist=\\\minisec{References}  begin{description} /\\\begin{itemize}/g" outputFile.tex # 
sed -i "s/\\\end{description}/\\\end{itemize}/g" outputFile.tex # 

# Removing unwanted lines from white paper template
sed -i "/{TSSG-YYYY-Area-00001}/d" outputFile.tex # Removes technical report number line from outputFile.tex
sed -i "/{Technical Report Sub-Title}/d" outputFile.tex # Removes technical report sub title from outputFile.tex
#sed -i "/{An executive summary of what is contained in this technical report}/d" outputFile.tex # Removes executive summary section from outputFile.tex

sed -i "/basicstyle=ootnotesize/d" outputFile.tex # removes line containing the specified string
sed -i "/^{hyperref}$/d" outputFile.tex # removes line(s) that is/are  the specified string only
sed -i "/earpage$/d" outputFile.tex # removes line(s) that is/are  the specified string only
sed -i "/^\%$/d" outputFile.tex # removes lines that are only percernt symbols
sed -i "/^$/d" outputFile.tex # removes empty lines


# Next step is use pdflatex to create outputFile.pdf from outputFile.tex
pdflatex outputFile.tex
exit # Exits script