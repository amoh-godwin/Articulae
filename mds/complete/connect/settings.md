# Application Settings

[text]

## Basic use

Qcore application handles the non ui part of the application, you didn't have to use it, unless of course for things like registering the app. After registering you could now call QSettings.

```python
import sys
from PyQt6.QtCore import QCoreApplication, QSettings
from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine

app = QGuiApplication(sys.argv)

QCoreApplication.setOrganizationName("Educative")
QCoreApplication.setApplicationName("ViewMagic")
settings = QSettings()

engine = QQmlApplicationEngine()
engine.load("./main.qml")
engine.quit.connect(app.quit)

sys.exit(app.exec())

```

`code_qml.txt`

If you did this Qt will automatically remember, when last the user opened the filedialog folder.

You can also use it to store data knowing it will survive after the app closes. These settings can even survive after the app has been deleted, if the uninstalling application didn't know of the existence of these files. Lets see how we can use this to store our own settings.

```python
import sys
from PyQt6.QtCore import QCoreApplication, QSettings
from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine

app = QGuiApplication(sys.argv)

QCoreApplication.setOrganizationName("Educative")
QCoreApplication.setApplicationName("ViewMagic")
settings = QSettings()
settings.setValue('theme', 'dark')
settings.setValue('background', 'dimgrey')
settings.setValue('font-size', '16')

print(settings.allKeys())

engine = QQmlApplicationEngine()
engine.load("./main.qml")
engine.rootObjects()[0].setProperty('background_color', settings.value('background'))
engine.quit.connect(app.quit)

sys.exit(app.exec())

```

`code_qml1.txt`

From the above code,

Normally on windows your settings are stored in the registry.
