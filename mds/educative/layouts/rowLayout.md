# RowLayout

A `RowLayout` places object types in a row.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "RowLayout"

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.preferredWidth: 50
            Layout.fillHeight: true
            color: "dodgerblue"

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "lightgrey"
        }

        Rectangle {
            Layout.preferredWidth: 250
            Layout.fillHeight: true
            color: "dimgrey"
        }

    }


}
```

All of the `Layout` attached properties can be applied on the `RowLayout`

## Items spaced apart

Sometimes, you want two items to be placed at both ends.

### Using alignment

We can use the `alignment` attached property

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "RowLayout"

    RowLayout {
        anchors.centerIn: parent
        width: parent.width
        height: 48
        spacing: 0

        Rectangle {
            Layout.preferredWidth: 50
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignLeft
            color: "orange"

            Text {
                anchors.centerIn: parent
                text: "<"
                font.pixelSize: 20
            }

        }

        Rectangle {
            Layout.preferredWidth: 50
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignRight
            color: "dodgerblue"

            Text {
                anchors.centerIn: parent
                text: ">"
                font.pixelSize: 20
            }
        }

    }


}

```

But if there are more than two items, `alignment` wont work proper.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "RowLayout"

    RowLayout {
        anchors.centerIn: parent
        width: parent.width
        height: 48
        spacing: 0

        Rectangle {
            Layout.preferredWidth: 50
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignLeft
            color: "orange"

            Text {
                anchors.centerIn: parent
                text: "<"
                font.pixelSize: 20
            }

        }

        Rectangle {
            Layout.preferredWidth: 50
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignLeft
            color: "gold"

            Text {
                anchors.centerIn: parent
                text: ">"
                font.pixelSize: 20
            }
        }

        Rectangle {
            Layout.preferredWidth: 50
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignRight
            color: "dodgerblue"

            Text {
                anchors.centerIn: parent
                text: ">"
                font.pixelSize: 20
            }
        }

    }


}


```

### Using fillWidth

In that case, you put in a `Rectangle` and set its to `fillWidth`. That way, it consumes all the remain width, after the other items widths have been consumed. Since it is in the middle, it will push the other items to the polar ends of row.

```qml

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "RowLayout"

    RowLayout {
        anchors.centerIn: parent
        width: parent.width
        height: 48
        spacing: 0

        Rectangle {
            Layout.preferredWidth: 50
            Layout.fillHeight: true
            color: "orange"

            Text {
                anchors.centerIn: parent
                text: "<"
                font.pixelSize: 20
            }

        }

        Rectangle {
            Layout.preferredWidth: 50
            Layout.fillHeight: true
            color: "gold"

            Text {
                anchors.centerIn: parent
                text: ">"
                font.pixelSize: 20
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"
        }

        Rectangle {
            Layout.preferredWidth: 50
            Layout.fillHeight: true
            color: "dodgerblue"

            Text {
                anchors.centerIn: parent
                text: ">"
                font.pixelSize: 20
            }
        }

    }


}

```
