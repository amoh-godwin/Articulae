# Flags 2

[text]

* Customized title gives a title and no system menu
  
  ```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Flags 2"
    flags: Qt.CustomizeWindowHint
}

```
  
  Make the window to stay on top of every other windows
  
  ```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Flags 2"
    flags: Qt.WindowStaysOnTopHint | Qt.X11BypassWindowManagerHint
}

```
  
  You have to mix it with bypass for it to work on X11.

* You can use transparent input flag to ensure window doesn't accept any input at all. Mixing it with framelessWindow hint will make it the ultimate informational window

* ```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 400
    height: 400
    title: "Flags 2"
    flags: Qt.WindowTransparentForInput | Qt.FramelessWindowHint
}

```

* [text]
