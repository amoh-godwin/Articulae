# Write the Python code

Now lets connect the UI code with python.

* Create a new file and name it main.py

* Open it and write this code in it

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

Run it and have a feel of what is like to create an app with Python and Qml code.
