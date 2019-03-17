# Dependency install
sudo apt-get update
sudo apt-get install python-pip pyhton-dev
sudo apt-get install python-virtaulenv

# Activate virtual env
virtualEnvFolder=~/ve
virtualenv --system-site-packages $virutalEnvFolder
source $virtualEnvFolder/bin/activate


#This one should be initiated by refering this site. https://www.tensorflow.org/install/pip
TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.12.0-cp36-cp36m-linux_x86_64.whl

# install tensorflow:
pip install --upgrade $TF_BINARY_URL


