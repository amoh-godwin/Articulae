# DropArea

[text]

# Basic use

* containsDrag for basic changes

* onEntered for multiple changes

* onDropped when it is dropped.

# onDropped

the event is drop. A `DropArea` offers so many methods for working with a file. But the most reliable of all of them is getting the url and then reading the file's data using the url. Trying to get the contents of the file from the activity is a hassle.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "DropArea"

    Rectangle {
        anchors.centerIn: parent
        width: 400
        height: 360
        color: dArea.containsDrag ? "gold" : "dodgerblue"

        Text {
            id: datapreview
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            wrapMode: Text.WrapAnywhere
            color: "white"
        }

        DropArea {
            id: dArea
            anchors.fill: parent

            onDropped: (drop) => {
                var fm = drop.formats[0]
                datapreview.text = drop.urls[0]
            }

        }

    }

}

```

# Dragging

`Drag` is an attached property. Every item can implement a drag on it.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Drag and Drop"


    Rectangle {
        width: 80
        height: 80
        color: "dodgerblue"

        Drag.active: msArea.drag.active

        MouseArea {
            id: msArea
            anchors.fill: parent
            drag.target: parent

        }

    }

}

```

# Re-ordering with Drag and Drop
