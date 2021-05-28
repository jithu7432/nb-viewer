#!/usr/bin/python3
import subprocess
import webbrowser
import sys
import os
import path

notebook = sys.argv[1]
convert = path.path_to_jupyter + ' nbconvert --to html ' + notebook
subprocess.call(convert.split())
html = notebook[:-5] + 'html'
file = webbrowser.open(html, 2)
os.remove(html)

