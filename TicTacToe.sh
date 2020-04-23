#/bin/bash -x

ROWS=3;
COLUMNS=3;
placeHolder="-";
playerSymbol="X";
compSymbol="O";
rowPosition=0;
columnPostion=0;

declare -A gameBoard

function initBoard() {
	for (( row=0; row<ROWS; row++ ))
	do
		for (( column=0; column<COLUMNS; column++ ))
		do
			if [[ $row -eq $rowPosition && $column -eq $columnPosition ]]
			then
				if (($playerSymbol))
				then
					holdPosition=$playerSymbol;
				else
					holdPosition=$compSymbol;
			fi
				gameBoard[$row, $column]=$holdPosition;
			else
			gameBoard[$row, $column]=$placeHolder;
			fi
		done
	done
}

function printBoard() {
	printf "\n~ Tic Tac Toe ~"
	printf "\n-------------\n"
	for (( row=0; row<ROWS; row++ ))
	do
		for ((column=0; column<COLUMNS; column++ ))
		do
			printf "| ${gameBoard[$row, $column]} "
		done
		printf "|\n-------------\n"
	done
}

initBoard
printBoard

echo "your Symbol is : $playerSymbol"
echo "computer symbol is : $compSymbol"


function filingBoard() {
	row=$0
	column=$1
	symbol=$2

	gameBoard[$row, $column]=$symbol;
}

filingBoard 0 0 X

function	occupiedPositionCheck() {
	row=$0;
	column=$1;

	if [[ ${gameBoard[$row, $column]} == $placeHolder ]]
	then
		echo "position is not occupied"
		return 0
	fi
	
	return 1
	
}

function tossCoin() {
	echo -e "\n press Enter to Toss a Coin :"
	read ch
	coin=$(( RANDOM % 2 ))
	
	#flip coin
	if (( $coin == 0 ))
	then
		echo "you are Playing First..."
		
	else
		echo "computer is Playing First..."
	fi
	return $coin
}

tossCoin

function playGame() {
	while [ true ]
	do
		read -p "Enter Raw : " row
		read -p "Enter Column : " column

		occupie=$(( "occupiedPositionCheck $row $column" ))

		if [[ occupie == 0 ]]
		then
			filingBoard $row $column X
		else
			echo "position is already occupied. try again"
		fi
		
		printBoard
}
	


