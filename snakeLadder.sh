#!/bin/bash

echo "WELCOME TO SNAKE AND LADDER"

#Initializing the constants
START_POSITION=0;
<<<<<<< HEAD
PLAYER_1=1;
PLAYER_2=2;
=======
WIN_POSITION=100;
PLAYERS=1;
>>>>>>> UC4_playingCondition
NO_PLAY=1;
LADDER=2;
SNAKE=3;
WIN_POSITION=100;

#Variables
position=0
option=0
dice=0
playerTemp=0;
diceCountOne=0;
diceCountTwo=0;
playerOnePosition=0;
playerTwoPosition=0;



#To check options for playing
checkOption()
{
	tag=$1
	dice=$2
	option=$3
	case $option in
		$NO_PLAY)
			if [ $tag -eq $PLAYER_1 ]
			then
				playerOnePosition=$playerOnePosition
			else
				playerTwoPosition=$playerTwoPosition
			fi
			;;
		$LADDER)
			if [ $tag -eq $PLAYER_1 ]
			then
				playerTemp=$(( $playerOnePosition + $dice ))
				if [  $playerTemp -gt $WIN_POSITION ]
				then 
					playerOnePosition=$playerOnePosition;
				else
					playerOnePosition=$playerTemp;
				fi
			else
				playerTemp=$(( $playerTwoPosition + $dice ))
				if [  $playerTemp -gt $WIN_POSITION ]
				then 
					playerTwoPosition=$playerTwoPosition;
				else
					playerTwoPosition=$playerTemp;
				fi
			fi
			;;
		$SNAKE)
<<<<<<< HEAD
			if [ $tag -eq $PLAYER_1 ]
=======
			position=$(( $position - $dice ))
			if [ $position -lt $START_POSITION ]
>>>>>>> UC4_playingCondition
			then
				playerTemp=$(( $playerOnePosition - $dice ))
				if [ $playerTemp -lt $START_POSITION ]
				then
					playerOnePosition=$START_POSITION;
				else
					playerOnePosition=$playerTemp;
				
				fi
			else
				
				playerTemp=$(( $playerTwoPosition - $dice ))
				if [ $playerTemp -lt $START_POSITION ]
				then
					playerTwoPosition=$START_POSITION;
				else
					playerTwoPosition=$playerTemp;
				
				fi
			fi
				
			;;
	esac
	if [ $tag -eq $PLAYER_1 ]
	then
		echo "Player 1 position" $playerOnePosition
	else
		echo "Player 2 position" $playerTwoPosition
	fi
}

<<<<<<< HEAD

game(){
	while :
	do
		((diceCountOne++))
	 	checkOption $PLAYER_1 $(( RANDOM % 6 + 1)) $(( RANDOM % 3 ))      #for player one
		
		if [ $playerOnePosition -eq $WIN_POSITION -o $playerTwoPosition -eq $WIN_POSITION ]
		then
				break #breaks the infinite loop if condition is true
		fi

		((diceCountTwo++))
		checkOption $PLAYER_2 $(( RANDOM % 6 + 1)) $(( RANDOM % 3 ))      #for player two

	done
}

game

#to find the winner
if [  $playerOnePosition -eq $WIN_POSITION ]
then
	echo " Player one has won by rolling $diceCountOne times"
else
	echo " Player two has won by rolling $diceCountTwo times"
fi
=======
#To play continuously to reach 100th position
while [ $position -lt $WIN_POSITION ]
do
	checkOption
done
>>>>>>> UC4_playingCondition
