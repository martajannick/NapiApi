#!/bin/bash
# declare STRING variable
STRING="SubtitleList (select, deleteSigns, list, deleteRepet)"
#print variable on a screen
echo $STRING
echo "Choose Subtitles to prepare"
rm OutputSubtitles/* 
rm Results/*
cd InputSubtitles
files=$(ls *.txt)
i=1
for j in $files
do
echo "$i.$j"
file[i]=$j
i=$(( i + 1 ))
done

echo "Enter number of txt file"
read input
echo "Subtitles fors ${file[$input]}"
cp ${file[$input]} ../OutputSubtitles/${file[$input]}
sed -i 's/<[^>]\+>/ /g' ../OutputSubtitles/${file[$input]}

#sed -i 's/[^A-Za-z0-9]/ /g' ../OutputSubtitles/${file[$input]} #forEnglishOnly 
# tr -sc '[:alnum:][:punct:]' ' ' <file  #usuwa nieang znaki

sed -i ':a;N;$!ba;s/\n/ /g' ../OutputSubtitles/${file[$input]}
sed -i 's/  / /g' ../OutputSubtitles/${file[$input]}
sed -i 's/  / /g' ../OutputSubtitles/${file[$input]}
sed -i 's/  / /g' ../OutputSubtitles/${file[$input]}
sed -i 's/ /\n/g' ../OutputSubtitles/${file[$input]}
tr [:upper:] [:lower:] < ../OutputSubtitles/${file[$input]} > ../OutputSubtitles/nowy.txt
 sort ../OutputSubtitles/nowy.txt | uniq > ../OutputSubtitles/SortedListed.txt
 rm ../OutputSubtitles/nowy.txt
cd ..

comm -12 OutputSubtitles/SortedListed.txt OutputDictionary/o1.txt >> Results/Learn_A1.txt
comm -12 OutputSubtitles/SortedListed.txt OutputDictionary/o2.txt >> Results/Learn_A2.txt
comm -12 OutputSubtitles/SortedListed.txt OutputDictionary/o3.txt >> Results/Learn_B1.txt
comm -12 OutputSubtitles/SortedListed.txt OutputDictionary/o4.txt >> Results/Learn_B2.txt
comm -12 OutputSubtitles/SortedListed.txt OutputDictionary/o5.txt >> Results/Learn_C1.txt
comm -12 OutputSubtitles/SortedListed.txt OutputDictionary/o6.txt >> Results/Learn_C2.txt



read end