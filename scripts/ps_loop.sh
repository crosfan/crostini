#!/bin/bash
for (( c=1; c<=10; c++ ))
do  
   ps -aux >> ps_out.txt
   sleep 1
done
