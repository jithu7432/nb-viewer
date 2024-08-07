#!/usr/bin/env python
import os
import sys
import nbformat

from nbconvert import HTMLExporter

from PyQt5.QtWidgets import QApplication
from PyQt5.QtWebEngineWidgets import QWebEngineView
from PyQt5.QtCore import QUrl
from PyQt5.QtWidgets import QApplication, QWidget, QFileDialog

os.environ["QTWEBENGINE_DISABLE_SANDBOX"] = "1"
os.environ["QT_AUTO_SCREEN_SCALE_FACTOR"] = "1"
os.environ["QT_SCALE_FACTOR"] = "1"

WIDTH, HEIGHT  = 0, 0

class MainWindow(QWebEngineView):
    def __init__(self):
        global HEIGHT
        global WIDTH
        super(MainWindow, self).__init__()
        self.setWindowTitle("JUPYTER NOTEBOOK VIEWER")
        self.resize(HEIGHT // 2, WIDTH // 2)
        self.showMaximized()


class FilePicker(QWidget):
    def __init__(self):
        super().__init__()
        self.title = "JUPYTER NOTEBOOK VIEWER"
        self.filename = None
        self.initialze()

    def initialze(self):
        self.setWindowTitle(self.title)
        self.open_filename_dialog()

    def open_filename_dialog(self):
        options = QFileDialog.Options()
        options |= QFileDialog.DontUseNativeDialog
        filename, _ = QFileDialog.getOpenFileName(
            self, "NOTEBOOK VIEWER", "", "IPython (*.ipynb)", options=options
        )
        if filename:
            self.filename = filename


def execute(app, file_path):
    notebook = file_path
    htmlname = f"{os.path.splitext(os.path.split(notebook)[1])[0]}.html"
    html_exporter = HTMLExporter()
    html_exporter.template_name = "classic"

    notebook = nbformat.read(os.path.join(os.getcwd(), notebook), as_version=4)
    body, _ = html_exporter.from_notebook_node(notebook)

    filename = f"/tmp/{htmlname}"

    with open(filename, "w") as file:
        file.write(body)

    wind = MainWindow()
    wind.setUrl(QUrl.fromLocalFile(filename))
    wind.show()

    sys.exit(app.exec_())


def main():
    global WIDTH
    global HEIGHT

    app = QApplication(sys.argv)
    size = app.primaryScreen().size();

    WIDTH, HEIGHT = size.width(), size.height()

    if len(sys.argv) == 1:
        ex = FilePicker()
        if ex.filename:
            execute(app, ex.filename)
        else:
            sys.exit()
    else:
        execute(app, sys.argv[1])


if __name__ == "__main__":
    exit(main())
