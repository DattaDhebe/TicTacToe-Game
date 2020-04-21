#/bin/bash -x

noOfRows=3;
noOfColumns=3;
placeHolder="-";
declare -A gameBoard

function initBoard() {
	for (( row=1; row<=noOfRows; row++ ))
	do
		for (( column=1; column<=noOfRows; column++))
		do
			gameBoard[$row, $column]=$placeHolder
		done
	done
}
function printBoard() {
	for (( row=1; row<=noOfRows; row++))
	do
		for ((column=1; column<=noOfColumns; column++))
		do
			printf "| ${gameBoard[$row, $column]} "
		done
		printf "|\n"
	done
}

initBoard
printBoard
x=1;
o=2;

printf "\nPlease, Choose Symbol to  play  :\n1. X\n2. O\n"
read -p "your choice : " choice

case $choice in
	$x)
		echo "your choice is $x."
		;;
	$o)	
		echo "your choice is $o."
		;;
	*)
		echo "wrong Choice, please select from above option."
		;;
esac
