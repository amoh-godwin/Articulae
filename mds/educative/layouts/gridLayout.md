# GridLayout

A `GridLayout` places object types in a grid. Each item becomes a cell withing the grid.

In a `GridLayout` all the children are set to `fillWidth` and `fillHeight`.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "GridLayout"

    GridLayout {
        anchors.fill: parent
        columns: 2
        rowSpacing: 0
        columnSpacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "dodgerblue"

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "lightgrey"
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


    }


}
```

You can control the width and height by setting their `columnSpan` and `rowSpan`

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "GridLayout"

    GridLayout {
        anchors.fill: parent
        columns: 3
        rowSpacing: 0
        columnSpacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.columnSpan: 2
            color: "dodgerblue"

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.rowSpan: 2
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


    }


}
```

`GridLayout` is controlled by setting the `columns` property, since `flow` is set to `GridLayout.LeftToRight`. If the `flow` is set to `GridLayout.TopToBottom`, the `GridLayout` will be controlled by the `rows` property.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "GridLayout"

    GridLayout {
        anchors.fill: parent
        flow: GridLayout.TopToBottom
        rows: 3
        rowSpacing: 0
        columnSpacing: 0

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
            Layout.rowSpan: 2
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
