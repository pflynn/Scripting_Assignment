sed "/% coding: utf-8/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\documentclass [a4paper,abstracton,titlepage]{scrartcl}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\pagestyle{plain}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\usepackage{makeidx}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\usepackage[table]{xcolor}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\usepackage{color}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\definecolor{LinkColor}{rgb}{0.33,0.42,0.18}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\definecolor{TableEvenColor}{rgb}{0.93,1,0.8}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\definecolor{TableOddColor}{rgb}{0.93,1,1}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\definecolor{TableBorderColor}{rgb}{0.55,0.67,0.73}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\definecolor{ListingBorderColor}{rgb}{0.55,0.55,0.55}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\definecolor{ListingBackgroundColor}{rgb}{0.95,0.95,0.95}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\definecolor{SidebarBorderColor}{rgb}{0.95,0.95,0.95}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\definecolor{SidebarBackgroundColor}{rgb}{1,1,0.93}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\usepackage{type1ec}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt
sed "/\usepackage[english]{babel}/d" inputCopy.txt > tempfile.txt
mv tempfile.txt inputCopy.txt