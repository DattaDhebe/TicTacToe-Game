#!/bin/bash -x

noOfRows=3;
noOfColumns=3;
initSymbol="-"

function initBoard() {
	for (( row=1; row<=noOfRows; row++ ))
	do
		for (( column=0; column<=noOfRows; column++))
		do
			board[$row, $column]=$initSysmbol
		done
	done
}



			

