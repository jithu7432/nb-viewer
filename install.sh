#!/bin/bash

END="/opt/nbv/"

echo "Begining Installation"

# go to /usr/include/ if a folder named python3.9 doesnot exist then,
# rename PYTHON to the name of the folder eg: python3.6

PYTHON='python3.10'  

# installing necessary pip packages to the system python

/usr/bin/pip3 install -r ./requirements.txt

cython -3 --embed -o notebook.c notebook.pyx
# gcc -Os -I /usr/include/$PYTHON notebook.c -l$PYTHON -o notebook
# gcc -Os `python-config --includes` notebook.c `python-config --abiflags` -o notebook
gcc -Os `python-config --includes` notebook.c -l$PYTHON -o notebook

echo "Compilation successful"
rm notebook.c 

if [ ! -d $END ]; then 
    sudo mkdir -p $END;
fi

if [ ! -d $HOME/.local/share/applications/ ]; then
    mkdir -p $HOME/.local/share/applications/;
fi


sudo cp ./notebook.desktop $HOME/.local/share/applications/
sudo cp ./notebook $END
sudo cp ./notebook.ico $END
sudo cp ./LICENSE $END
sudo cp ./README.md $END
sudo cp ./uninstall.sh $END
sudo cp -r ./templates $END

echo "Installed succesfully"
exit

