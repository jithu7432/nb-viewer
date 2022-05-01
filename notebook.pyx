import os
import sys
import nbformat

from nbconvert import HTMLExporter

from PyQt5.QtWidgets import QApplication
from PyQt5.QtWebEngineWidgets import QWebEngineView
from PyQt5.QtCore import QUrl
from PyQt5.QtWidgets import QApplication, QWidget, QFileDialog

os.environ['QTWEBENGINE_DISABLE_SANDBOX'] = '1' # --no-sandbox

class Window(QWebEngineView):

    def __init__(self):
        super(Window, self).__init__()
        self.setWindowTitle('JUPYTER NOTEBOOK VIEWER')
        self.resize(800, 600)
        self.setZoomFactor(1.15)  # change the zoom factor/ scale size here! 1.05 equates to 105 %
        self.showMaximized()


class App(QWidget):

    def __init__(self):
        super().__init__()
        self.title = 'JUPYTER NOTEBOOK VIEWER'
        self.top = 0
        self.left = 0
        self.width = 1280
        self.height = 720
        self.filename = None
        self.initUI()

    def initUI(self):
        self.setWindowTitle(self.title)
        self.setGeometry(self.left, self.top, self.width, self.height)
        self.openFileNameDialog()

    def openFileNameDialog(self):
        options = QFileDialog.Options()
        options |= QFileDialog.DontUseNativeDialog
        fileName, _ = QFileDialog.getOpenFileName(self, "NOTEBOOK VIEWER", "", "IPython (*.ipynb)", options=options)
        if fileName: self.filename = fileName

def main(sys_argv_comp):
    notebook = sys_argv_comp
    htmlname = os.path.splitext(os.path.split(notebook)[1])[0] + '.html'
    html_exporter = HTMLExporter()
    html_exporter.template_name = 'lab'

    notebook = nbformat.read(os.path.join(cwd, notebook), as_version=4)
    body, _ = html_exporter.from_notebook_node(notebook)

    filename = "/tmp/" + htmlname

    with open(filename, 'w') as file: file.write(body)

    wind = Window()
    wind.setUrl(QUrl.fromLocalFile(filename))
    wind.show()

    sys.exit(app.exec_())


if __name__ == "__main__":
    cwd = os.getcwd()
    app = QApplication(sys.argv)

    if len(sys.argv) == 1:
        ex = App()

        if ex.filename:
            main(ex.filename)
        else:
            sys.exit()
    else:
        main(sys.argv[1])
