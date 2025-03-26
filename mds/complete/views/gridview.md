# GridView

A `GridView` places items in a grid. It uses a `model` the same way a `ListView` does. The only difference is a `ListView` places items in a list whereas a `GridView` places items in a grid.

## Basic Use

A `GridView` is found in the `QtQuick` package. It uses a `model` like a `ListView`, but it needs `cellWidth` and `cellHeight` set.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 1000
    height: 600
    title: "GridView"


    GridView {
        id: grid
        anchors.fill: parent
        anchors.margins: 16
        anchors.leftMargin: 8
        model: 10
        cellWidth: 300
        cellHeight: 216
        clip: true
        delegate: Rectangle {
            width: grid.cellWidth
            height: grid.cellHeight

            Rectangle {
                anchors.fill: parent
                anchors.leftMargin: 8
                anchors.bottomMargin: 8
                color: "dodgerblue"
            }

        }

    }
}

```

From the above code, you can see that the `delegate`'s `width` and `height` are set to the `cellWidth` and `cellHeight`. If you set it anything else, you might get undesirable effects.

`GridView` also doesn't have a spacing property, so you have to make up for that. You can use the direct child of the delegate as the parent container for whatever you want to place in the delegate.

## Highlight

Using the `currentItem` property we can show which item is the current item.

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 1000
    height: 600
    title: "GridView"


    GridView {
        id: grid
        anchors.fill: parent
        anchors.margins: 16
        anchors.leftMargin: 8
        model: 10
        cellWidth: 300
        cellHeight: 216
        clip: true
        focus: true

        delegate: Rectangle {
            width: grid.cellWidth
            height: grid.cellHeight

            Rectangle {
                anchors.fill: parent
                anchors.leftMargin: 8
                anchors.bottomMargin: 8
                color: parent == grid.currentItem ? "dodgerblue" : "navy"
            }

        }

    }
}

```

We are yet to respond to mouse event, so for now we navigate to an item in the grid using the keyboard navigation controls

You can also use the highlight property to set a highlight item

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 1000
    height: 600
    title: "GridView"


    GridView {
        id: grid
        anchors.fill: parent
        anchors.margins: 16
        anchors.leftMargin: 8
        model: 10
        cellWidth: 300
        cellHeight: 216
        clip: true
        focus: true
        highlight: Rectangle {
            z: 2
            width: grid.cellWidth
            height: grid.cellHeight
            color: "transparent"

            Rectangle {
                anchors.fill: parent
                anchors.leftMargin: 8
                anchors.bottomMargin: 8
                color: "gold"
                opacity: 0.5
            }
        }

        delegate: Rectangle {
            width: grid.cellWidth
            height: grid.cellHeight

            Rectangle {
                anchors.fill: parent
                anchors.leftMargin: 8
                anchors.bottomMargin: 8
                color: "dodgerblue"
            }

        }

    }
}

```

[text]

## Direction and Flow

Using layoutDirect: Qt.RightToLeft, the items have now been laid out from right first then left.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 640
    height: 500
    title: "GridView"

    ScrollView {
        anchors.fill: parent

        GridView {
            id: grid
            anchors.fill: parent
            anchors.margins: 16
            anchors.leftMargin: 8
            model: 10
            cellWidth: 300
            cellHeight: 216
            clip: true
            layoutDirection: Qt.RightToLeft
            focus: true

            delegate: Rectangle {
                width: grid.cellWidth
                height: grid.cellHeight

                Rectangle {
                    anchors.fill: parent
                    anchors.leftMargin: 8
                    anchors.bottomMargin: 8
                    color: "dodgerblue"

                    Text {
                        anchors.centerIn: parent
                        text: index + 1
                        font.pixelSize: 36
                        color: "white"
                    }

                }

            }

        }

    }
}

```

[text]

Using flowTopToBottom - the items now scroll horizontally.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 640
    height: 500
    title: "GridView"

    ScrollView {
        anchors.fill: parent

        GridView {
            id: grid
            anchors.fill: parent
            anchors.margins: 16
            anchors.leftMargin: 8
            model: 10
            cellWidth: 300
            cellHeight: 216
            clip: true
            flow: GridView.FlowTopToBottom
            focus: true

            delegate: Rectangle {
                width: grid.cellWidth
                height: grid.cellHeight

                Rectangle {
                    anchors.fill: parent
                    anchors.leftMargin: 8
                    anchors.bottomMargin: 8
                    color: "dodgerblue"

                    Text {
                        anchors.centerIn: parent
                        text: index + 1
                        font.pixelSize: 36
                        color: "white"
                    }

                }

            }

        }

    }
}

```

[text]

## Dynamic sizing

Creating a view with cells of different or proportional sizes is complex and beyound the scope of this lesson. In certain cases, you can use a GridLayout to achieve that effect. So a GridView should only be used for cells of the same size.
