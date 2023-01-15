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


