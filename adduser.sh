echo "input your name"
read username
useradd -d /home/$username -m $username -s /bin/bash
passwd $username