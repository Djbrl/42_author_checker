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
FILE=auteur

echo "${GRN}42 AUTHOR CHECKER${NC}\n"

if [ -f "$FILE" ];
then
	if [ -f "LOGFILE_author_checker.txt" ];
	then
		rm LOGFILE_author_checker.txt
	fi
	author=`cat auteur`
	echo "author file found ! this is $GRN$author$NC's project. Let's check files :"
	LINE1=`grep -R "by [a-z]" * | wc -l`
	LINE2=`grep -R "by $author" | wc -l`
	grep -R "by [a-z]" * > LOGFILE_author_checker.txt
	if [ $LINE1 != $LINE2 ];
	then
		echo "${RED}FAIL${NC}, some files aren't yours. You can find grep results in the ${YLW}logfile${NC}."
	else
		echo "${GRN}SUCCESS! All files are yours, $author."
		echo "If you don't trust this result, you can find grep results with PATHS in the ${YLW}logfile${NC}."
	fi
else
	echo "author file not found."
fi
