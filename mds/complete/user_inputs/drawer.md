# Drawer

A Drawer provides a side-pane that can be dragged into the window.

## Basic use

A Drawer is found in the QtQuick.Controls.Basic package. To use it, just call the Drawer object.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Drawer"

    Drawer {
        width: 0.25 * parent.width
        height: parent.height
    }
}

```

## Dynamic width

The width of the Drawer can be set dynamically or modified on the fly.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Drawer"

    property bool portrait: width < 800

    Drawer {
        width: portrait ? 200 : 0.25 * parent.width
        height: parent.height
    }
}

```

## Customization

A drawer can be customised according to the look and feel you want. You probably customize it to remove the border.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Drawer"

    property bool portrait: width < 800

    Drawer {
        width: portrait ? 200 : 0.25 * parent.width
        height: parent.height

        background: Rectangle {
        }

    }

    Rectangle {
        anchors.fill: parent
        color: "gold"
    }
}

```

## Drawer position

The Drawer provides a position property which ranges from 0.0 which is when the drawer is not open to 1.0, which is when the drawer is fully opened.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Drawer"
    color: "pink"

    property bool portrait: width < 800

    Drawer {
        id: drawer
        width: portrait ? 200 : 0.25 * parent.width
        height: parent.height

        background: Rectangle {
            color: "#44ffffff"
        }

    }

    Rectangle {
        anchors.right: parent.right
        width: drawer.position ? parent.width - (drawer.width * drawer.position): parent.width
        height: parent.height
        color: "gold"
    }
}

```

## Interactivity

The ability for a user to drag to open and close a drawer can be disabled. The interactive property does that, when it is set to false will disables the ability to drag to open and close the drawer, to opposite is also true.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Drawer"
    color: "pink"

    property bool portrait: width < 800

    Drawer {
        id: drawer
        width: portrait ? 200 : 0.25 * parent.width
        height: parent.height
        modal: false
        interactive: false

        background: Rectangle {
            color: "#44ffffff"
        }

    }

    Rectangle {
        anchors.right: parent.right
        width: drawer.position ? parent.width - (drawer.width * drawer.position): parent.width
        height: parent.height
        color: "gold"

        Button {
            text: "Toggle Modal"
            onClicked: drawer.visible ? drawer.close() : drawer.open()
        }
    }
}

```

You can open and close the drawer however by using the methods, open and close.

## Edges

You can choose which side of the window the drawer will open from.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Drawer"
    color: "pink"

    Drawer {
        id: drawer
        width: parent.width
        height: 100
        edge: Qt.TopEdge

        background: Rectangle {
            color: "#ffffff"
        }

    }

}

```

The code above pulls the drawer from the top edge, you can also edit the code in the playground to make the drawer open from any of the other edges. Qt.BottomEdge for the bottom edge, Qt.RightEdge and Qt.LeftEdge for the right and left edges respectively.
