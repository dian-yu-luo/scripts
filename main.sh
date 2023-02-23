#!/bin/bash
userPath=$HOME

sudo sed -i 's/bullseye/testing/g' /etc/apt/sources.list
apt update -y &&apt upgrade -y && apt install vim git -y

echo "do you want add a user (Y/N)"
read isCheck
if [ -z $isCheck ] || [ $isCheck = y ] || [ $isCheck = Y ]; then
    echo "input your name"
    read username
    # 读取用户名，并把用户名翻到username里
    if sudo useradd -d /home/$username -m $username -s /bin/bash; then
        echo "ok,and then input you password "
    else
        echo "you need sudo permission"
        exit
    fi
    sudo passwd $username
fi

echo "do you want mkdir this user have sudo privalige?(Y/N)"
read isCheck
if [ -z $isCheck ] || [ $isCheck = y ] || [ $isCheck = Y ]; then
    echo "ok I will do that for you "
    sudo sed -i "21 i\ ${username}	ALL=(ALL:ALL) ALL" /etc/sudoers
fi

echo "do you want add git config?(Y/N)"
read isCheck
if [ -z $isCheck ] || [ $isCheck = y ] || [ $isCheck = Y ]; then
    git config --global user.name "dianyuluo"
    git config --global user.email 1739556970@qq.com
    git config --global credential.helper store
fi

echo "do you want add VIM config?(Y/N)"
read isCheck
if [ -z $isCheck ] || [ $isCheck = y ] || [ $isCheck = Y ]; then
    sudo apt update && sudo apt upgrade && sudo apt install wget vim
    wget -P $userPath/ https://github.com/dian-yu-luo/scripts/blob/main/conf/.vimrc
fi
