#!/usr/bin/python3

import subprocess
import sys
import os
import path
import webview



notebook = sys.argv[1]

htmlname = '.' + notebook.split('/')[-1][:-5] + 'html'
htmlpath = "/".join(notebook.split('/')[:-1]) + '/'
htmlfile = htmlpath + htmlname
notebook_ = notebook.split('/')[-1]

temp = open(htmlfile, 'w+')

convert = path.path_to_jupyter + ' nbconvert --to html ' + notebook + ' --stdout'

out = subprocess.call(convert.split(), stdout = temp)

temp.close()

#Pywebview


window = webview.create_window(title = 'Jupyter Notebook Viewer - ' + notebook_, url = htmlfile, text_select = True, height = 1366, width = 632)
webview.start()

os.remove(htmlfile)
