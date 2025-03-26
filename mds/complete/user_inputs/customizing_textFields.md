# Customizing A TextField

[text]

## Basic customization

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400


    TextField {
        id: field
        anchors.centerIn: parent
        width: parent.width / 2
        placeholderText: "Enter URL"

        background: Rectangle {
            implicitWidth: field.width
            implicitHeight: field.height
            radius: field.height / 2
            border.color: "lightgrey"
        }

    }

}

```

We have used the width of the textField

We can also customize the fonts.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400


    TextField {
        id: field
        anchors.centerIn: parent
        width: parent.width / 6 * 5
        placeholderText: "Enter URL"
        font.family: "Times New Roman"
        font.pixelSize: 21
        color: "dodgerblue"

        background: Rectangle {
            implicitWidth: field.width
            implicitHeight: field.height
            radius: field.height / 2
            border.color: "lightgrey"
        }

    }

}

```

[text]

## Responding to mouse events

[text]

We use the focus property

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400


    TextField {
        id: field
        anchors.centerIn: parent
        width: focus || hovered ? parent.width / 6 * 5 : 80
        placeholderText: "Enter URL"
        horizontalAlignment: Text.AlignHCenter

        background: Rectangle {
            implicitWidth: field.width
            implicitHeight: field.height

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: field.focus ? "#0073cf" : "lightgrey"
            }

        }

    }

}

```

[text]
