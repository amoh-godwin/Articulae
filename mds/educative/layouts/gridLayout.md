# GridLayout

Learn how to lay out items using a GridLayout.

A `GridLayout` places object types in a grid. Each item becomes a cell within the grid.

In a `GridLayout` all the children will have to set `fillWidth` and `fillHeight` to true. This will ensure that each child fills the full dimensions of a cell. A cell's dimension is determined by the width of the `GridLayout` and the number of columns or rows in the `GridLayout`. That is if a `GridLayout` has a width of 400 pixels and the columns are 4, then each cell will have a width of 100 pixels provided the spacing for columns is set to 0. If the spacing is not set to 0 but 4, then for 4 columns there will be three spaces in between them so the total spacing will be 12. So instead of 100 pixels, each cell will have 97 pixels. The spacing between columns is set using `columnSpacing` and the spacing between rows is set using `rowSpacing`.

Lets see an example of a basic GridLayout implementation. You will notice that we have set rowSpacing and columnSpacing to 0 in **lines 14 and 15**.

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

From the above code, we have four `Rectangle`s in the GridLayout, and when you run the code, you will notice that they have been placed in a grid of two columns and two rows. This is not the default placing, we have declared on **line 13** of the code that we want two columns. If we didn't specify we would have had 4 columns to match the number of items in the `GridLayout`.

## GridLayout will varied cell sizes

For our above code, each child is set to one cell. We can change that and make a child span more than one cell. And by that method, create a `GridLayout` with varied cell sizes. You control how many cells a child can span by specifying `columnSpan` and/or `rowSpan` for the item.

Lets see this in action. Take a look at the code below. You can see that we have specified a `columnSpan` on line 20 for the first `Rectangle` and a `rowSpan` on line 28 for the second `Rectangle`.

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
            Layout.columnSpan: 2 // 20
            color: "dodgerblue"

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.rowSpan: 2 // 28
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

The `flow` property controls how Items are laid out in the GridLayout. Whether they are laid out from left to right or from top to bottom. The default is that items are laid out from left to right. Also the `GridLayout` is controlled by setting the `columns` property because `flow` is set to `GridLayout.LeftToRight`. If the `flow` is set to `GridLayout.TopToBottom`, then the `GridLayout` will be controlled by the `rows` property.

In the code below we set `flow` to `GridLayout.TopToBottom` in **line 13**.

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

So now when you run the code above you will notice that now the Rectangles are laid out from top to bottom.

No matter how much you love GridLayout, you wouldn't use it that much in the real-life. You will only use the GridLayout on a need to use basis, since using a combination of RowLayouts and ColumnLayouts is mostly what you want for a layout.
