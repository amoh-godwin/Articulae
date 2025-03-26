# Application icon

[text]

## Setting the icon

[text]

```python
import sys
from PyQt6.QtGui import QGuiApplication, QIcon
from PyQt6.QtQml import QQmlApplicationEngine

app = QGuiApplication(sys.argv)
app.setWindowIcon(QIcon('./educative.png'))


engine = QQmlApplicationEngine()
engine.load("./main.qml")
engine.quit.connect(app.quit)

sys.exit(app.exec())

```

`code_qml.txt`

[text]

The window font can also be set this way. But becareful it will change every 

font.

```python
import sys
from PyQt6.QtGui import QGuiApplication, QIcon, QFont
from PyQt6.QtQml import QQmlApplicationEngine

app = QGuiApplication(sys.argv)
app.setWindowIcon(QIcon('./educative.png'))
app.setFont(QFont('Symbol', pointSize=14))

engine = QQmlApplicationEngine()
engine.load("./main.qml")
engine.quit.connect(app.quit)

sys.exit(app.exec())

```

`code_qml1.txt`

You can run processes after when the application quit event has been triggered.

[text]

```python
import sys
from time import sleep

from PyQt6.QtGui import QGuiApplication, QIcon
from PyQt6.QtQml import QQmlApplicationEngine

app = QGuiApplication(sys.argv)
app.setWindowIcon(QIcon('./educative.png'))


def houseKeeping():

    info ='Cleanup all remaing data.'
    info += ' And close all running threads.'
    print(info)

engine = QQmlApplicationEngine()
engine.load("./main.qml")
engine.quit.connect(app.quit)
app.aboutToQuit.connect(houseKeeping)

sys.exit(app.exec())

```

`code_qml2.txt`

Mind you by this time the UI has already ended. This is just for cleanup purposes
