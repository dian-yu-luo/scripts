#!/bin/bash

isCheckY=y
isCheckN=n

echo "do you want add a user (Y/N)"
read isCheck
if [ $isCheck = y ] || [ $isCheck = Y ]; then
    echo "input your name"
    read username
    # 读取用户名，并把用户名翻到username里
    if useradd -d /home/$username -m $username -s /bin/bash; then
        echo "ok,and then input you password "
    else
        echo "you need sudo permission"
        exit
    fi
    passwd $username
fi

echo "do you want mkdir this user have sudo privalige?"
read isCheck
if [ $isCheck = y ] || [ $isCheck = Y ]; then
    echo "ok I will do that for you "
    sed -i '21 i\www	ALL=(ALL:ALL) ALL' /etc/sudoers
fi
