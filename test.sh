userPath=$HOME
echo "do you want add VIM config?(Y/N)"
read isCheck
if [ -z $username ] || [ $isCheck = y ] || [ $isCheck = Y ]; then
    sudo apt update && sudo apt upgrade && sudo apt install vim wget -y
    wget -P $userPath/ https://raw.githubusercontent.com/dian-yu-luo/scripts/main/conf/.vimrc
fi
