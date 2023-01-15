# ColumnLayout

When multiple visual object types are placed inside of another object type, they stack one on top of the other inside that object type, with the last to be written placed on top of the stack. This is why we use layouts to control the layouting of the items that are placed.

Layouts are found within the **QtQuick.Layouts** package.

For our first layout object type we begin with `ColumnLayout`.

A column Layout places items into a single column.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "ColumnLayout"

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "tomato"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "pink"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "green"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "yellow"
        }

    }


}
```

A items placed inside a layout type doesn't have a `width` and a `height` so you can't do `width: parent.width` or do so for `height`. You have to use Layout.fillWidth or `Layout.fillHeight` respectively.

Just as the name implies, they consume the full width and the full height. If they are other visual object types it shares the space with the other object types and sort of consumes the remaining space.

The `spacing` property controls the spacing in between the items of the layout.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "ColumnLayout"

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "tomato"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "pink"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "green"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "yellow"
        }

    }


}
```

You can use `preferredWidth` and `preferredHeight` to set specific dimensions.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "ColumnLayout"

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            color: "dodgerblue"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 250
            color: "lightgrey"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 150
            color: "dimgrey"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            color: "gold"
        }

    }


}
```

Also you can set `maximumWidth`, `maximumHeight` and `minimumWidth` and `minimumHeight`. With this properties, `preferredWidth` or `preferredHeight` must also be set.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "ColumnLayout"

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.preferredWidth: 500
            Layout.maximumWidth: 300
            Layout.minimumWidth: 250
            Layout.preferredHeight: 50
            color: "dodgerblue"

        }

        Rectangle {
            Layout.preferredWidth: 500
            Layout.maximumWidth: 600
            Layout.minimumWidth: 250
            Layout.preferredHeight: 250
            color: "lightgrey"
        }

        Rectangle {
            Layout.preferredWidth: 500
            Layout.maximumWidth: 600
            Layout.minimumWidth: 250
            Layout.preferredHeight: 150
            color: "dimgrey"
        }

        Rectangle {
            Layout.preferredWidth: 500
            Layout.maximumWidth: 600
            Layout.minimumWidth: 250
            Layout.preferredHeight: 50
            color: "gold"
        }

    }


}
```

For the first `Rectangle` even when the `prefferedWidth` is to `500`, the `maximumWidth` is taking effect. For the remaining 3 Rectangles, when you try expanding the width of the application by dragging at the edges of the window you can see that the width of the Rectangles will not go beyound 600 pixels.
