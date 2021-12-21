__author__ = "Jithin Johnson"

import nbformat
import os
import sys

from nbconvert import HTMLExporter

from PyQt5.QtWidgets import QApplication
from PyQt5.QtWebEngineWidgets import QWebEngineView
from PyQt5.QtCore import QUrl


class Window(QWebEngineView):
    
    def __init__(self):
        super(Window, self).__init__()
        self.setWindowTitle('JUPYTER NOTEBOOK VIEWER')
        self.resize(800,600)
        self.showMaximized()


cwd = os.getcwd()
app = QApplication(sys.argv)

if len(sys.argv) == 1:
    wind = Window()
    wind.setUrl(QUrl.fromLocalFile('/opt/nbv/templates/index.html'))
    wind.show()
    sys.exit(app.exec_())


notebook = sys.argv[1]
htmlname = os.path.splitext(os.path.split(notebook)[1])[0] + '.html'
htmlpath = os.path.split(notebook)[0]
htmlfile = os.path.join(htmlpath, htmlname)
notebook_ = os.path.split(notebook)[1]

html_exporter = HTMLExporter()
html_exporter.template_name = 'lab'


notebook = nbformat.read(os.path.join(cwd, notebook), as_version=4)
body, resources = html_exporter.from_notebook_node(notebook)
filename = "/tmp/" + htmlname
with open(filename, 'w') as file:
    file.write(body)
    file.close()

wind = Window()
wind.setUrl(QUrl.fromLocalFile(os.path.join(cwd, filename)))
wind.show()
sys.exit(app.exec_())