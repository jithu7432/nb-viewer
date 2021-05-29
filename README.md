## Jupyter Notebook Viewer (Ubuntu)
* This is a utility which lets you preview jupyter notebooks faster on your Ubuntu machine with a double click.
* Requires no internet and is faster.
* If you have installed Jupyter in a virtual environment, update the path of Jupyter on `/opt/nbv/path.py`  after the installation.

* Shows gibberish when the filename contains spaces, eg: `"hello world.ipynb"`, rename the file properly to ensure compatibility eg: `helloworld.ipynb`.  

# Installation
* Clone the repository

```markdown
git clone https://github.com/jithu7432/nb-viewer.git ; cd nb-viewer 
```

* Make the `install.sh` executable using the command 

```markdown
sudo chmod +x install.sh
```

* Run the installer, enter password when prompted
```markdown
./install.sh
```
* Make sure you have updated the path to Jupyter on the file, path to jupyter can be found using `which jupyter`
 ```markdown
sudo nano /opt/nbv/path.py
```
## Usage
* When using for the first time, right click a `.ipynb` file,
 
 `properties` >> `open with`>>`Notebook Viewer`

* From the next time, view Jupyter notebooks with a double click!
