#!/bin/bash 

if [ ! -e bin ]
then 
    echo "ERROR: Run this from the main directory: bin/questions.sh"
    exit 1
fi

echo Starting...

cd practicals
../bin/extract_questions.pl

cd ../test
../bin/extract_questions.pl test.org

if [ ! -e Questions_Unix_fundamentals.txt ]
then 
    echo "ERROR: Can not find file 'Questions_Unix_fundamentals.txt'"
    exit 1
fi
echo "Questions_Unix_fundamentals.txt -> Test_Unix_fundamentals.txt"
mv Questions_Unix_fundamentals.txt Test_Unix_fundamentals.txt
echo "Done"
