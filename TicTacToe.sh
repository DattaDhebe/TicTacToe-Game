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
			#if [[ $row -eq $rowPosition && $column -eq $columnPosition ]]
			#then
			#	if (($playerSymbol))
			#	then
			#		holdPosition=$playerSymbol;
			#	else
			#		holdPosition=$compSymbol;
			#	fi
			#	gameBoard[$rowPosition, $columnPosition]=$holdPosition;
			#else
			gameBoard[$row, $column]=$placeHolder;
			#fi
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

function fillingBoard() {
	row=$0
	column=$1
	symbol=$2

	gameBoard[$row, $column]=$symbol;
}

filingBoard
function playGame() {
	
	echo "Your Symbol is : $playerSymbol"
	echo "computer Symbol is : $compSymbol"
		
	coin=$(( "tossCoin" ))
		
	if [ $coin -eq 0 ]
	then
		playerInput $playerSymbol
	else
		computerInput $compSymbol		
	fi		
		printBoard
	
		
}
playGame


#declare variable for  storing position

function playerInput() {
	
		read -p "Enter Row : " rowPosition
		read -p "Enter Column : " columnPosition
		
		initBoard $rowPosition $columnPosition $playerSymbol

		computerInput 
		
}

function computerInput() {
	rowPosition=$((RANDOM % 3))
	columnPosition=$((RANDOM % 3))
	
	initBoard $rowPosition $columnPosition $compSymbol
	
	playerInp
ut
	
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



