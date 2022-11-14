# Create your grading script here

set -e

rm -rf student-submission
git clone $1 student-submission
echo "successfullly coloned" 
cp TestListExamples.java student-submission/
cp -r lib/ student-submission/lib
cd student-submission
APATH="ListExamples.java"

if [[ -f $APATH ]]
then
  echo "file ListExanples.java exists"
  javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java 
  java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > testoutput.txt
  grep "2 tests" testoutput.txt
  exit
fi

find * > find-result.txt
grep "ListExamples.java" > grep-result.txt
if [[ $? -eq 0]]
then 
  cp student-submission/ < grep-result.txt
  javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java 
  java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > testoutput.txt
  grep "2 tests" testoutput.txt
  exit
fi

echo "file ListExanples.java not exists"

