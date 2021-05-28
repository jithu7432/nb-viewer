## Jupyter Notebook Viewer
* This is a utility which lets you preview jupyter notebooks on your browser without starting a Jupyter server.
* Requires no internet and is faster.
* Whether you have installed Jupyter in a virtual environment or not, update the path of Jupyter on `jpath.py` by using the commmand `which jupyter` provides the path, in my case `/home/jithin/venv/bin/jupyter`
* Add an alias after cloning this repository to `.bash_aliases` for running the script easily from the terminal.
* After adding as alias say `nbv`, then run as `nbv test.ipynb`
* Breaks down when the notebook has spaces in name eg: `hello world.ipynb`

* Edit: `nbv` in a shell now opens all `.ipynb` in the browser, pervious code also availabe as `nbvbackup.py`.
