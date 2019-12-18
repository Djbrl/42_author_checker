#Author : dsy@student.42.fr | github.com/djbrl
#	author_checker.sh
#	Is a script meant for 42 Students,  to help you check if all your files are yours.
#	Also checks if you have an author file.
#	Launch this script from the root of your project.
#	This is a RUDIMENTARY IMPLEMENTATION, feel free to clone and make your own elaborate version.

GRN='\033[1;32m'
RED='\033[1;31m'
YLW='\033[1;33m'
NC='\033[0m'

PRJ=../
FILE=${PRJ}auteur
LOG=LOGFILE_author_checker.txt

echo "${GRN}42 AUTHOR CHECKER${NC}\n"

if [ -n "$1" ]
then
	author=$1
fi

echo $author
if [ -f "$FILE" ] || [ -n "$1" ];
then
	if [ -f "${PRJ}LOGFILE_author_checker.txt" ];
	then
		rm ${PRJ}$LOG
	fi

	if [ -f "$FILE" ]
	then
		author=`cat $FILE`
	fi
	
	echo "author file found ! this is $GRN$author$NC's project. Let's check files :"
	LINE1=`grep -R ":..:[0-9][0-9] by [a-z]\|By: [a-z]" ${PRJ}* | wc -l`
	LINE2=`grep -R ":..:[0-9][0-9] by ${author}\|By: ${author}" ${PRJ}* | wc -l`
	grep -R ":..:[0-9][0-9] by [a-z]..[a-z]\|By: [a-z][a-z]" ${PRJ}* > ${PRJ}$LOG
	if [ $LINE1 != $LINE2 ];
	then
		echo "${RED}FAIL${NC}, some files aren't yours. You can find grep results in the ${YLW}logfile${NC}."
	else
		echo "${GRN}SUCCESS!$NC All files are yours, ${GRN}$author$NC."
		echo "If you don't trust this result, you can find grep results with ${YLW}PATHS$NC in the ${YLW}logfile${NC}."
	fi
else
	echo "author file not found."
fi
