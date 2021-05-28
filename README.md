
## Jupyter Notebook Viewer (Ubuntu)
* This is a utility which lets you preview jupyter notebooks faster on your web browser without starting a Jupyter server.
* Requires no internet and is faster.
* Whether you have installed Jupyter in a virtual environment or not, update the path of Jupyter on `path.py` by using the commmand `which jupyter`,     `/home/jithin/venv/bin/jupyter`in my case.

* Crashes when spaces are present in the name, eg: `"hello world.ipynb"`  

# Installation
* Clone the repository
```markdown

git clone https://github.com/jithu7432/nb-viewer.git ; cd nb-viewer 
```
* Create a directory for `nbv`  and copy all the contents to it
```markdown
sudo mkdir /opt/nbv ; sudo cp -a . /opt/nbv
```
* Add an alias for using the utility
```markdown
echo "alias nbv='/opt/nbv/nbv.py'">> ~/.bash_aliases
```
* Make sure you have updated the path to Jupyter on the file 
 ```markdown
sudo nano /opt/nbv/path.py
```
## Usage
* Navigate to any directory containing Jupyter notebooks, open terminal and run `nbv` to open all notebooks in your default web browser.
