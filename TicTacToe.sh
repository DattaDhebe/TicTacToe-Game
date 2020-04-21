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
