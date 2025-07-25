from PyQt6.QtCore import QTimer, QObject, pyqtSignal, pyqtProperty
from PyQt6.QtWidgets import QApplication
from PyQt6.QtQml import QQmlApplicationEngine
import sys


class RpmBridge(QObject):
    rpmChanged = pyqtSignal()

    def __init__(self):
        super().__init__()
        self._rpm = 0

    def get_rpm(self):
        return self._rpm

    def set_rpm(self, value):
        if self._rpm != value:
            self._rpm = value
            self.rpmChanged.emit()

    rpm = pyqtProperty(int, fget=get_rpm, fset=set_rpm, notify=rpmChanged)


# Instancia de la app
app = QApplication(sys.argv)

# Crea el engine de QML
engine = QQmlApplicationEngine()

# Crea el puente Python → QML
bridge = RpmBridge()
engine.rootContext().setContextProperty("RpmBridge", bridge)

# Carga la interfaz QML
engine.load("main.qml")

# Verifica que cargó bien el archivo QML
if not engine.rootObjects():
    print("Error: no se pudo cargar el archivo main.qml")
    sys.exit(-1)

# Asignamos un valor a RPM
bridge.set_rpm(3000)

# Ejecuta la app
sys.exit(app.exec())
