#!/bin/bash

for s in da01 da02 da04 da05 da06 da07 da08 da09 da10 da11 da12 da14 da15
do
        if [[ "$s" != "$HOSTNAME" ]]
        then
		scp -r obj/release/* $s:/localdisk/mserafini/h-store/obj/release
		if [[ $? -ne 0 ]]
		then
			echo "Failed copying to $s"
			exit 1
		fi 
		scp plan.json $s:/localdisk/mserafini/h-store
		if [[ $? -ne 0 ]]
		then
			echo "Failed copying to $s"
			exit 1
		fi 
		scp *.jar $s:/localdisk/mserafini/h-store
		if [[ $? -ne 0 ]]
		then
			echo "Failed copying to $s"
			exit 1
		fi 
	fi
done