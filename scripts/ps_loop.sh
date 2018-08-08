#!/bin/bash
for (( c=1; c<=20; c++ ))
do  
   ps -aux >> ps_out.txt
   cat /run/tokens/penguin_token >> $LXD_CONF/token.txt
   sleep 1
done
