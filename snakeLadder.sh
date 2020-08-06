#!/bin/bash 

SNAKE=0
NO_PLAY=1
LADDER=2
START_POSITION=0
WIN_POSITION=100

diceCountOne=0
diceCountTwo=0
playerOnePosition=0
playerTwoPosition=0

echo "Welcome to Snake and Ladder"

#function to change the player 1 and player 2 positions
function checkOption(){
	 local diceNumber=$1
	 local option=$2
	 local position=$3
	 local currentResult=0

	case $option in
	$LADDER) currentResult=$(( position + diceNumber ))
		 if [ $currentResult -le $WIN_POSITION ]
		 then
			diceNumber=$(( RANDOM % 6 + 1))
		  	position=$(( position + diceNumber ))
		 fi
		 ;;

	$NO_PLAY) position=$position;;

	$SNAKE)	currentResult=$(( position - diceNumber ))
		if [ $currentResult -lt $START_POSITION ]
		then
			position=$START_POSITION
		else
			position=$currentResult
		fi
		;;

	esac
	echo $position
}

#function to play snake and ladder game
gameStarted(){
	while :
	do
		((diceCountOne++))
	 	playerOnePosition="$(checkOption $(( RANDOM % 6 + 1)) $(( RANDOM % 3 ))  $playerOnePosition )" #function call for player 1

		echo "Current position of player 1" $playerOnePosition
		echo "Current position of player 2" $playerTwoPosition

		if [ $playerOnePosition -eq $WIN_POSITION -o $playerTwoPosition -eq $WIN_POSITION ]
		then
				break #breaks the infinite loop if condition is true
		fi

		((diceCountTwo++))
		playerTwoPosition="$(checkOption  $((RANDOM % 6 + 1)) $(( RANDOM % 3 )) $playerTwoPosition )" #function call for player 2
	done
}

gameStarted

if [  $playerOnePosition -eq $WIN_POSITION ]
then
	echo "CONGRATS !! PLAYER 1 HAS WON THE GAME AND REACHED $playerOnePosition" 
	echo "Dice Rolled " $diceCountOne "times for player 1 to win"
else
	echo "CONGRATS !! PLAYER 2 HAS WON THE GAME AND REACHED $playerTwoPosition" 
	echo "Dice Rolled " $diceCountTwo "times for player 2 to win"
fi
