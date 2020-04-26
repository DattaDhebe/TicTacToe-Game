
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
			if [[ $row -eq $fill_row && $column -eq $fill_column ]]
			then
				holdPosition=$fill_symbol;
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
	fill_row=$1
	fill_column=$2
	fill_symbol=$3

	gameBoard[$fill_row, $fill_column]=$fill_symbol;
}

#filingBoard 0 0 X

function	occupiedPositionCheck() {
	row=$1;
	column=$2;

	if [[ ${gameBoard[$row, $column]} == $placeHolder ]]
	then
		echo "position is not occupied"
		return 0
	else
		return 1
	fi
}


function playGame() {
   while [ true ]
   do
      read -p "Enter Raw : " row
      read -p "Enter Column : " column

      occupie=$(( "occupiedPositionCheck $row $column" ))

      if [[ occupie == 0 ]]
      then
         filingBoard $row $column $playerSymbol
         while [ true ]
         do
            computer_rows=$(( RANDOM % 3 ))
            computer_Columns=$(( RANDOM % 3 ))
            occupiedPositionCheck $computer_rows $computer_columns
            if [[ occupie == 0 ]]
            then
               filingBoard $computer_rows $computer_columns $compSymbol
            fi
         done

      else
         echo "position is already occupied. try again"
      fi
      printBoard
   done
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
	
	playGame $coin
}

tossCoin

