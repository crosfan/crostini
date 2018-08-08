#!/bin/bash
for (( c=1; c<=50; c++ ))
do  
   ps -aux >> ps_out.txt
   cat /run/tokens/penguin_token >> $LXD_CONF/token.txt
   printf "\n" >> $LXD_CONF/token.txt
   sleep 1
done
