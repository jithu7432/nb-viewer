#!/bin/bash

END="/opt/nbv/"

echo "Begining Installation"

# go to /usr/include/ if a folder named python3.9 doesnot exist then,
# rename PYTHON to the name of the folder eg: python3.6

PYTHON='python3.9'  

# installing necessary pip packages to the system python

/usr/bin/pip install -r ./requirements.txt

cython -3 --embed -o notebook.c notebook.pyx
gcc -Os -I /usr/include/$PYTHON notebook.c -l$PYTHON -o notebook

echo "Compilation successful"
rm notebook.c 

if [ ! -d $END ]; then
    sudo mkdir -p $END;
fi

if [ ! -d $HOME/.local/share/applications/ ]; then
    mkdir -p $HOME/.local/share/applications/;
fi


sudo mv ./notebook.desktop $HOME/.local/share/applications/
sudo mv ./notebook $END
sudo mv ./notebook.ico $END
sudo mv ./LICENSE $END
sudo mv ./README.md $END
sudo mv ./templates $END
sudo mv ./uninstall.sh $END

echo "Installed succesfully"
exit

