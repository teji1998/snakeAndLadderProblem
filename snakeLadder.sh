#!/bin/bash

echo "WELCOME TO SNAKE AND LADDER"

#Initializing the constants
START_POSITION=0;
PLAYERS=1;
NO_PLAY=1;
LADDER=2;
SNAKE=3;
WIN_POSITION=100;

#Variables
position=$START_POSITION
playerTemp=0;

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
			playerTemp=$(( $position + $dice ))
			if [  $playerTemp -gt $WIN_POSITION ]
			then 
				position=$position;
				echo "Player will remain in the same position $position"
			else
				position=$playerTemp;
				echo "Player has got ladder.Move ahead to position $position."
			fi
			;;
		$SNAKE)
			playerTemp=$(( $position - $dice ))
			if [ $playerTemp -lt $START_POSITION ]
			then
				position=$START_POSITION;
				echo "Player will go start from beginning at position $position"
			else
				position=$playerTemp;
				echo "Player has got snake.Move back to position $position."
			fi
			;;
	esac
}


#To play continuously to reach 100th position
while [ $position -lt $WIN_POSITION ]
do
	checkOption
done