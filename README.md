# 42_author_checker
Just a simple project file checker to make sure all your files are yours!

This is a simple grep-using script meant to verify in all files that contain a 42 Header in your project, that they all belong to the author of the project.

This script was made for personal use and is a rudimentary (but functional!) implementation of file checking, feel free to use it, copy it, and/or improve it; BUT please let me know if you do improve it, so I can learn from your experience and make better file checkers in the future. You can also contact me if you have any questions or suggestions.
You can email me at sydjbrl@gmail.com, or on slack @dsy in 42_Paris.

**VARIABLES**

PRJ =  The path to your project, by default it is set at "../", so all you have to do is to clone thiss repo at the root of your project.
If you want to change this variable, make sure your new path is in a this/is/the/path/ format.

FILE = The path to your author file. By default, it is local, but you can change it if you want to. 
If you want to change this variable, make sure your new path is in a this/is/the/path/ format.

**USE CASES**

To use this script, simply launch 42_author_checker.sh in the root of your project and make sure you have an author file.
SUCCESS will be returned if :
- All files containing a header have the same author.

FAIL will be returned if :
- One or more of your files that has a header, have an author different from the one mentionned in your author file.
- This script is case-sensitive, so your username should be written in lowercase to be recognized, other that counts as a failure
- Your author doesn't follow the 42 format. It should only contain your login.

These cases are UNDEFINED, so check yourself please. This script will NOT warn you if one of your files has no header.
- Files without headers will not be checked at all.
- Your header isn't a 42 formatted header.

A LOGFILE will be produced containing what the grep command found, you can take a look at it to find where the files that aren't yours are. When you execute the script, the previous logfile is DELETED and REPLACED by the new one.
