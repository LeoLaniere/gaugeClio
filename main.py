from PyQt5.QtCore import QTimer
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine
import sys
from PyQt5.QtCore import QObject, pyqtSignal, pyqtProperty


class RpmBridge(QObject):
    def __init__(self):
        super().__init__()
        self._rpm = 0

    def get_rpm(self):
        return self._rpm

    def set_rpm(self, value):
        if self._rpm != value:
            self._rpm = value
            self.rpmChanged.emit()

    rpmChanged = pyqtSignal()
    rpm = pyqtProperty(int, fget=get_rpm, fset=set_rpm, notify=rpmChanged)





app = QApplication(sys.argv)
engine = QQmlApplicationEngine()
engine.load("main.qml")
sys.exit(app.exec_())

bridge = RpmBridge()
engine.rootContext().setContextProperty("RpmBridge", bridge)
bridge.set_rpm(3500)

