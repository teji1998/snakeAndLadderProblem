#!/bin/bash

echo "WELCOME TO SNAKE AND LADDER"

#Initializing the constants
START_POSITION=0;
PLAYERS=1;
NO_PLAY=1;
LADDER=2;
SNAKE=3;

#Variables
position=$START_POSITION

#To obtain numbers 1 to 6 on dice 
diceRoll()
{
	dice=$(( 1 + ($RANDOM % 6) ))
	echo " The result of the rolling of the dice is $dice "
}


#To check options for playing
checkOption()
{
	option=$(( 1 + ($RANDOM % 3) ))
	diceRoll
	case $option in
		$NO_PLAY)
			echo "Player won't move.You will stay in same position $position."
			;;
		$LADDER)
			position=$(( $position + $dice ))
			echo "Player has got ladder.Move ahead to $position."
			;;
		$SNAKE)
			position=$(( $position - $dice ))
			if [ $position -lt 0 ]
			then
				position=$START_POSITION;
			fi
			echo "Player has got snake.Move back to $position."
			;;
	esac
}
checkOption
