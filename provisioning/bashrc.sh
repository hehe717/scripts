if [ $# -lt 1 ] 
then
	echo "please enter userName"
	exit
fi

USER=$1

# Set user home
echo "#Set user home" >> ~/.bashrc
echo "alias home=\"cd /mnt/c/Users/$1\"" >> ~/.bashrc


sleep 1
source ~/.bashrc
