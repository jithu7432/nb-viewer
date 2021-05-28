## Jupyter Notebook Viewer
* This is a utility which lets you preview jupyter notebooks on your browser without starting a Jupyter server.
* Requires no internet and is faster.
* Whether you have installed Jupyter in a virtual environment or not, update the path of Jupyter on `jpath.py` by using the commmand `which jupyter`, in my case `/home/jithin/venv/bin/jupyter`
* Add an alias after cloning this repository to `.bash_aliases` for running the script easily from the terminal.
* `alias nbv='python3 ~/codes/nb-viewer/nbv.py'`
* After adding as alias say `nbv`, then run as `nbv test.ipynb`
* Breaks down when spaces are present in the name, eg: `"hello world.ipynb"`

* Edit: `nbv` in a shell now opens all `.ipynb` in the browser, pervious code also availabe as `nbvsingle.py`.

* Create a directory for `nbv` and navigate to it
```markdown
    sudo mkdir /opt/nbv ; cd /opt/nbv
```
* Clone the repository
```markdown
    git clone https://github.com/jithu7432/nb-viewer.git
```
* Add an alias for using the utility
```markdown
    echo "alias nbv='/opt/nbv/nb-viewer/nbv.py'">> ~/.bash_aliases
```

