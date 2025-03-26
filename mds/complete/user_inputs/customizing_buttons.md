# Customizing Buttons

[tex]

## Basic use

The first thing you want to customize is the background property.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Custom Button"


    Button {
        anchors.centerIn: parent
        text: "Click me!"

        background: Rectangle {
            color: "dodgerblue"
        }

    }

}

```

## Background

There is an implicitWidth and implicitHeight if you would like to control the dimensions.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Custom Button"


    Button {
        anchors.centerIn: parent
        text: "Ok!"

        background: Rectangle {
            implicitHeight: 40
            implicitWidth: 40
            radius: 20
            color: "dodgerblue"
        }

    }

}


```

When you set the radius to half of both the width and height, you would get a perfect circle



## ContentItem

To control the text that is drawn on top use the contentItem property.

You can use anchors on a contentItem, so we have used horizontalAlignment and verticalAlignment.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Custom Button"


    Button {
        id: btn
        anchors.centerIn: parent
        text: "Click Me!"

        background: Rectangle {
            implicitHeight: 40
            implicitWidth: 100
            radius: 20
            color: "dodgerblue"
        }

        contentItem: Text {
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            text: btn.text
            font: btn.font
            color: "white"
        }

    }

}

```

There is always some kind of padding around the contentItem. You can change it with paddding property or with the individual padding properties such as leftPadding, rightPadding.

## Responding to hover and pressed events

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Custom Button"


    Button {
        id: btn
        anchors.centerIn: parent
        text: "Click Me!"

        background: Rectangle {
            implicitHeight: 36
            implicitWidth: 120
            radius: 4
            color: btn.pressed ? Qt.darker("dodgerblue") : btn.hovered ? Qt.lighter("dodgerblue") : "dodgerblue"
        }

        contentItem: Text {
            verticalAlignment: Text.AlignVCenter
            text: btn.text
            font: btn.font
            color: btn.hovered? "black" : "white"
        }

    }

}

```

[text]
