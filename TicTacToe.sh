#/bin/bash -x

noOfRows=3;
noOfColumns=3;
placeHolder="-";
playerSymbol=0;
compSymbol=0;
rowPosition=0;
columnPosition=0;

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
	printf "\nPlease, Choose Symbol to  play  :\n1. X\n2. O\n"
	read -p "your choice : " choice

	case $choice in
		1)
			playerSymbol="X";
			echo "your choice is : $playerSymbol.";
			compSymbol="O";
			echo "computer choice is : $playerSymbol."
			;;
		2)
			playerSymbol="O";	
			echo "your choice is : $playerSymbol.";
			compSymbol="X";
			echo "computer choice is : $compSymbol."
			;;
		3)
			echo "bye bye..!!"
			break;
			;;
		*)
			echo "wrong Choice, please select from above option."
			;;
	esac
}
symbolChoice


function playerInput() {
	
		read -p "Enter Row : " rowPosition
		read -p "Enter Column : " columnPosition
		
		filingBoard $rowPosition $columnPosition $playerSymbol
				
}

function computerInput() {
	row=$((RANDOM % 3))
	column=$((RANDOM % 3))
	filingBoard $rowPosition $columnPosition $compSymbol
}

function tossCoin() {
	echo -e "\npress Enter to Toss a Coin :"
	read ch
	coin=$(( RANDOM % 2 ))
	if (( $coin == 0 ))
	then
		echo "you are Playing First..."
		playerInput $playerSymbol
	else
		echo "computer is Playing First..."
		computerInput $compSymbol
	fi
}

tossCoin


