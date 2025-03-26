# Window Properties

[text]

## Declaring properties

[text]

* use x and y properties.
  
  ```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Properties"
    x: 0
    y: 0
}

```

* setX and setY
  
  ```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 400
    height: 400
    title: "Properties"
    x: 0
    y: 0


    Button {
        anchors.centerIn: parent
        text: "Center Window"
        onClicked: {
            setX(Screen.width / 2 - (mainWindow.width / 2))
            setY(Screen.height / 2 - (mainWindow.height / 2))
        }
    }

}

```

* setWidth and setHeight
  
  ```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 400
    height: 400
    title: "Properties"
    x: 0
    y: 0


    Button {
        anchors.centerIn: parent
        text: "Change properties"
        onClicked: {
            setWidth(800)
            setHeight(300)
            setTitle("New title for properties")
        }
    }

}

```

* showMinimized and showMaximised
  
  ```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 400
    height: 400
    title: "Properties"
    x: 0
    y: 0


    RowLayout {
        width: 300
        anchors.centerIn: parent

        Button {
            text: "Maximize"
            onClicked: {
                showMaximized()
            }
        }

        Button {
            text: "Show normal"
            onClicked: {
                showNormal()
            }
        }

        Button {
            text: "Minimize"
            onClicked: {
                showMinimized()
            }
        }

    }

}

```
  
  [text]
