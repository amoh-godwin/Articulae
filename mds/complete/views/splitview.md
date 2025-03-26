# SplitView



## Basic Use

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "SplitView"

    SplitView {
        anchors.fill: parent

        Rectangle {
            SplitView.minimumWidth: 200
            color: "pink"
        }

        Rectangle {
            SplitView.minimumWidth: 200
            color: "gold"
        }

    }

}

```

For the two Rectangles that we have we could have specified SplitView.minimumWidth for just one of them. This will mean you can drag the divider all the way till the second Rectangle disappears, the divider will then be positioned at the edge of the window.

`implicitWidth` also works as specifying sort of a preferred width, it doesn't however work as a minimum width. If you would like a minimum width use SplitView.minimum width instead.



## Orientation

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "SplitView"

    SplitView {
        anchors.fill: parent
        orientation: Qt.Vertical

        Rectangle {
            implicitHeight: 400
            color: "pink"
        }

        Rectangle {
            SplitView.minimumHeight: 60
            color: "gold"
        }

    }

}

```

[text]



You can ofcourse mix them

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "SplitView"

    SplitView {
        anchors.fill: parent

        Rectangle {
            SplitView.minimumWidth: 200
            color: "pink"

            SplitView {
                anchors.fill: parent
                orientation: Qt.Vertical

                Rectangle {
                    SplitView.minimumHeight: 200
                    color: "#1c263b"
                }

                Rectangle {
                    SplitView.minimumHeight: 200
                    color: "#1f2a4c"
                }

            }

        }

        Rectangle {
            SplitView.minimumWidth: 100
        }

    }

}

```

[text]


