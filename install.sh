#!/bin/bash
mypath=$HOME
depath='/opt/nbv/'
echo "Installing dependencies.."
pip3 install -r requirements.txt
echo "Making Directory /opt/nbv/ .."
sudo mkdir $depath
sudo mkdir $mypath/.local/share/applications/
echo "Copying files to /opt/nbv/ .."
sudo cp -r ./ico $depath
sudo cp ./LICENSE $depath
sudo cp ./nbv.desktop $mypath/.local/share/applications/
sudo cp ./nbvs.py $depath
sudo cp ./path.py $depath
sudo cp ./README.md $depath
echo "Installation Successfull"
exit

