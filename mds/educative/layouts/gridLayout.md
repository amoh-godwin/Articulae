# GridLayout

Learn how to lay out items using a GridLayout.





A `GridLayout` places object types in a grid. Each item becomes a cell within the grid.

In a `GridLayout` all the children will have to set `fillWidth` and `fillHeight` to true. This will ensure that each child fits the full dimensions of cell. A cell's dimension is determined by the width of the `GridLayout` and the number of columns or rows of the `GridLayout`. That is if a `GridLayout` has a width of 400 pixels and the columns are 4, then each cell will have a width of 100 pixels provided the `spacing` property is set to `0`. If the spacing property is not set to 0 but maybe 4, then for 4 columns there will be three spaces in between them so the total spacing will be 12. So instead of 100 pixels, each cell will have 97 pixels.

Lets see an example of a basic GridLayout implementation. You will notice that we have set rowSpacing and columnSpacing to 0.

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

Even though each child of the `GridLayout` will have to be set to the full dimensions of a cell, you can actually make a child span more than one cell. With this method you can create a `GridLayout` with varied cell sizes. You can control how many cells a child can span by declaring `columnSpan` and `rowSpan` on it.

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

``GridLayout` is controlled by setting the `columns` property, since `flow` is set to `GridLayout.LeftToRight`. If the `flow` is set to `GridLayout.TopToBottom`, the `GridLayout` will be controlled by the `rows` property.

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

No matter how much you love GridLayout, you wouldn't use it that much in the real-life
