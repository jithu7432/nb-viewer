#!/usr/bin/python3

import nbformat
import os
import subprocess
import sys

from nbconvert import HTMLExporter
from PyQt5.QtWidgets import QApplication
from PyQt5.QtWebEngineWidgets import QWebEngineView
from PyQt5.QtCore import QUrl

cwd = os.getcwd()

app = QApplication(sys.argv)
window = QWebEngineView()


if len(sys.argv) == 1:
    window.setWindowTitle('JUPYTER NOTEBOOK VIEWER')
    window.setHtml('<t>Please right click a jupyter notebook, and open with <h4>Notebook Viewer</h4></t>')
    window.show()
    sys.exit(app.exec_())
    exit()

notebook = sys.argv[1]

htmlname = '.' + notebook.split('/')[-1][:-5] + 'html'
htmlpath = "/".join(notebook.split('/')[:-1]) + '/'
htmlfile = htmlpath + htmlname
notebook_ = notebook.split('/')[-1]

html_exporter = HTMLExporter()
html_exporter.template_name = 'classic'


notebook = nbformat.read(os.path.join(cwd,notebook), as_version=4)
body, resources = html_exporter.from_notebook_node(notebook)

with open(htmlname, 'w') as file:
    file.write(body)
    file.close()


window.setWindowTitle("JUPYTER NOTEBOOK VIEWER - " + notebook_)
window.setUrl(QUrl.fromLocalFile(os.path.join(cwd,htmlname)))
window.show()
app.exec_()

os.remove(os.path.join(cwd,htmlname))
