#!/usr/bin/python3

import subprocess
import sys
import os
import path
import webview

if len(sys.argv) == 1:
	window = webview.create_window(title = 'Jupyter Notebook Viewer', html = "Please right click a '.ipynb' and open with Jupyter Notebook Viewer")
	webview.start()
	exit()

notebook = sys.argv[1]

htmlname = os.path.splitext(os.path.split(notebook)[1])[0] + '.html'
htmlpath = os.path.split(notebook)[0]
htmlfile = os.path.join(htmlpath, htmlname)
notebook_ = os.path.split(notebook)[1]

temp = open(htmlfile, 'w')

convert = path.path_to_jupyter + ' nbconvert --to html "' + notebook + '" --stdout'

out = subprocess.call(convert, stdout = temp, shell=True)

temp.close()

#Pywebview

window = webview.create_window(title = 'Jupyter Notebook Viewer - ' + notebook_, url = htmlfile, text_select = True, height = 1366, width = 632)
webview.start()

os.remove(htmlfile)
