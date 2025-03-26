# Threading

[text]

## Basic

[text]

```python
import sys

from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine
from func import Backend


app = QGuiApplication(sys.argv)

backend = Backend()

engine = QQmlApplicationEngine()
engine.load("./main.qml")
engine.rootObjects()[0].setProperty('backend', backend)
engine.quit.connect(app.quit)

sys.exit(app.exec())

```

`code_pyfunc.txt`

`code_qml.txt`

[text]

With threading

```python
import sys

from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine
from func import Backend


app = QGuiApplication(sys.argv)

backend = Backend()

engine = QQmlApplicationEngine()
engine.load("./main.qml")
engine.rootObjects()[0].setProperty('backend', backend)
engine.quit.connect(app.quit)

sys.exit(app.exec())

```

`code_pyfunc1.txt`

`code_qml.txt`

[text]

## Sending back data with Signals

[text]

```python
import sys

from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine
from func import Backend


app = QGuiApplication(sys.argv)

backend = Backend()

engine = QQmlApplicationEngine()
engine.load("./main.qml")
engine.rootObjects()[0].setProperty('backend', backend)
engine.quit.connect(app.quit)

sys.exit(app.exec())

```

`code_pyfunc2.txt`

`code_qml2.txt`

[text]

## Managing threads

If a process can run several times per second in a separate thread, it will be run several times in a second. This will end up using all the system resources. Limit how many times they can run in a second by adding a sleep function, that way, it gives some of the system resources for other process to also have access. For instance...
