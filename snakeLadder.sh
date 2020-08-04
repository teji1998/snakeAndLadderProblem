#!/bin/bash

echo "WELCOME TO SNAKE AND LADDER"

#Initializing the constants
START_POSITION=0;
PLAYERS=1;

#To obtain numbers 1 to 6 on dice 
diceRoll()
{
	dice=$(( 1 + ($RANDOM % 6) ))
	echo " The result of the rolling of the dice is $dice "
}
diceRoll