#!/bin/bash


password=$@
passLength=${#password}
flag=1

#echo "password:$password"
#echo "password length: $passLength"

if (($passLength < 10));
  then
  echo "password's length must be 10 or higher"
 flag=0
fi
 
if ! [[ $password =~ [[:alpha:]] && $password =~ [[:digit:]] ]]; 
  then
  echo "Password must contain a letter and a digit"
 flag=0
fi
  
  
if   [[ ! "$password" =~ [[:upper:]] || ! "$password" =~ [[:lower:]]  ]];
  then
  echo "Password must contain a uppercase and lowercase letters"
   flag=0
fi

if   ((flag==1))
then 
  echo "$(tput setaf 2) $password"
  else
  echo "$(tput setaf 1) $password"
fi




