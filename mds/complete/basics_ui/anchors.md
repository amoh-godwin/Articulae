# Anchors

Object types are placed at coordinates 0,0 by default. You can change this by specifying a layout type or by anchoring it to another object type.

Anchors can be applied either in reference to another object type as a whole or it can be applied according to an anchor line of an object type.

### anchors.fill

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 400

    Rectangle {
        anchors.fill: parent
        color: "tomato"

    }

}
```

### anchors.centerIn

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500

    Rectangle {
        anchors.centerIn: parent
        width: 250
        height: 250
        color: "dodgerblue"
    }

}
```

### anchors.verticalCenter

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500

    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        width: 250
        height: 250
        color: "dodgerblue"
    }

}
```

### anchors.horizontalCenter

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        width: 250
        height: 250
        color: "dodgerblue"
    }

}
```

### anchors.left, right

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        color: "dodgerblue"
    }

}
```

can be applied as individuals

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500

    Rectangle {
        anchors.right: parent.right
        width: 200
        height: 200
        color: "dodgerblue"
    }

}
```

### anchors.topMargin, bottomMargin

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    color: "dimgrey"

    Rectangle {
        anchors.right: parent.right
        anchors.rightMargin: 24
        anchors.left: parent.left
        anchors.leftMargin: 24
        anchors.topMargin: 12
        height: 50
        color: "dodgerblue"
    }

}
```

### anchors.margins

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    color: "dimgrey"

    Rectangle {
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.margins: 12
        height: 50
        color: "dodgerblue"
    }

}
```

### anchors shorthand

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    color: "dimgrey"

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            margins: 16
        }

        height: 50
        color: "dodgerblue"
    }

}
```
