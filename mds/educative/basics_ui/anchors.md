# Anchors

Object types are place at coordinates 0,0. But you can change this with anchors.

Anchors can be applied either in reference to another object type as a whole or it can be applied according to an anchor line of an object type.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 400

    Rectangle {
        id: rect01
        width: parent.width
        height: parent.height
        color: "dodgerblue"

        Rectangle {
            id: rect02
            width: 200
            height: 200
            color: "gold"
        }

    }

    Rectangle {
        id: rect03
        width: 100
        height: 200
        color: "lightgrey"
    }

    Rectangle {
        id: rect04
        width: parent.width
        height: 50
        color: "dimgrey"
    }

}
```

lets apply anchors in reference to the object types.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 400

    Rectangle {
        id: rect01
        anchors.fill: parent
        color: "dodgerblue"

        Rectangle {
            id: rect02
            width: 200
            height: 200
            anchors.centerIn: parent
            color: "gold"
        }

    }

}
```

`rect01` has been anchored to fill all of the anchors of its parent, which is the ApplicationWindow. On the other hand, rect02 has been anchored to the center of its parent rect01.

Anchored on an object types coordinates

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 400

    Rectangle {
        id: rect01
        anchors.fill: parent
        color: "dodgerblue"

    }

    Rectangle {
        id: rect03
        width: 100
        height: 350
        anchors.right: parent.right
        color: "lightgrey"
    }

    Rectangle {
        id: rect04
        width: parent.width
        height: 50
        anchors.bottom: rect01.bottom
        color: "dimgrey"
    }

}
```

Now lets apply them to the anchor lines

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 400

    Rectangle {
        id: rect01
        width: 200
        height: 50
        anchors.horizontalCenter: parent.horizontalCenter
        color: "gold"
    }

    Rectangle {
        id: rect02
        width: parent.width
        height: 50
        anchors.verticalCenter: parent.verticalCenter
        color: "dimgrey"
    }

}
```

Then you can apply margins to the anchors.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 400

    Rectangle {
        id: rect01
        width: 100
        height: 350
        anchors.right: parent.right
        anchors.rightMargin: 24
        color: "lightgrey"
    }

    Rectangle {
        id: rect02
        width: parent.width
        height: 50
        anchors.bottom: parent.bottom
        color: "gold"
        anchors.bottomMargin: 8
    }
}
```

You can apply the anchor margins all at once.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 400

    Rectangle {
        id: rect01
        anchors.fill: parent
        anchors.margins: 16
        color: "dodgerblue"

    }

}
```

for each margin, there should be an accompanied anchor co-ordinate set.

There is a shorthand property for setting anchors.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 400

    Rectangle {
        id: rect01
        anchors {
            left: parent.left
            leftMargin: 16
            right: parent.right
            rightMargin: 16
            top: parent.top
            bottom: parent.bottom
            bottomMargin: 16
        }
        color: "tomato"

    }

}
```
