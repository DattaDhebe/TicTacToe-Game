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
	printf "\n~ Game Board ~"
	printf "\n-------------\n"
	for (( row=1; row<=noOfRows; row++))
	do
		for ((column=1; column<=noOfColumns; column++))
		do
			printf "| ${gameBoard[$row, $column]} "
		done
		printf "|\n-------------\n"
	done
}

initBoard
printBoard

function symbolChoice() {
	printf "\nPlease, Choose Symbol to  play  :\n1. X\n2. O\n3. exit\n"
	read -p "your choice : " choice

	case $choice in
		1)
			yourSymbol="X";
			echo "your choice is : $yourSymbol.";
			compSymbol="O";
			echo "computer choice is : $compSymbol."
			;;
		2)
			yourSymbol="O";	
			echo "your choice is : $yourSymbol.";
			compSymbol="X";
			echo "computer choice is : $compSymbol."
			;;
		3)
			echo "bye bye..!!"
			;;
		*)
			echo "wrong Choice, please select from above option."
			;;
	esac
}
#symbolChoice

function tossCoin() {
	echo -e "\npress Enter to Toss a Coin :"
	read ch
	coin=$(( RANDOM % 2 ))
	if (( $coin == 0 ))
	then
		echo "you are Playing First..."
	else
		echo "computer is Playing First..."
	fi
}

#tossCoin
