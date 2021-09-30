#!/bin/bash
mkdir temp 
cd temp/
wget https://raw.githubusercontent.com/dian-yu-luo/scripts/main/apt.sh 
wget https://raw.githubusercontent.com/dian-yu-luo/scripts/main/adduser.sh  
wget https://raw.githubusercontent.com/dian-yu-luo/scripts/main/getconfig.sh 

bash apt.sh 
bash adduser.sh 
bash getconfig.sh 