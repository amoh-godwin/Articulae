# Write the Python code

Now lets connect the UI code with python.

* Create a new file and name it main.py

* Make sure that main.qml is in the same folder as main.py

* Open main.py and write the following code in it

main.py

```python
import sys
from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine


app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
engine.load("main.qml")
engine.quit.connect(app.quit)

sys.exit(app.exec())
```

In the above code, we import sys module from python, QGuiApplication, and QQmlApplicationEngine.

* QGuiApplication handles all processes included background process needed to run the Gui Application.

* QQmlApplicationEngine handles the connection of QML as the UI layer for the application.

* QQmlApplicationEngine also handles all communications to and from QML.

Run it and have a feel of what is like to create an app with Python and Qml code.
