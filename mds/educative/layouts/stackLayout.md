# StackLayout

Normally, visual object types not placed in any `Layout` type, stack on top of each other.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "StackLayout"

    Rectangle {
        width: 400
        height: 200
        color: "dodgerblue"

    }

    Rectangle {
        width: 400
        height: 200
        color: "tomato"
    }

    Rectangle {
        width: 400
        height: 200
        color: "dimgrey"
    }

    Rectangle {
        width: 400
        height: 200
        color: "gold"
    }

    Rectangle {
        width: 400
        height: 200
        color: "lightgrey"
    }



}
```

Even though there is enough visual space to have had two items placed beside each other horizontally, the items are placed on top of each other. Since all items by default are placed at coordinates `x: 0`, `y: 0`.

`StackLayout` places items just like that. But with `StackLayout` the item that will be shown first it the one that is written first inside the `StackLayout`. You have control over the items through indexing. Otherwise you would have had to give each of the items, an `id` and then control them using the id. You can set which visual object type is shown by setting the `currrentIndex` property.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "GridLayout"

    StackLayout {
        anchors.fill: parent
        currentIndex: 2

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "dodgerblue"

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "tomato"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "dimgrey"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "gold"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "lightgrey"
        }

    }

}
```
