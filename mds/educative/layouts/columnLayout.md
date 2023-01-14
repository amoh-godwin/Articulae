# ColumnLayout

When multiple visual object types are placed inside of another object type, they stack one on top of the other inside that object type, with the last to be written placed on top of the stack. This is why just about any multiple visual object types placed within any object type were placed inside of a layout type.

Layouts are found within the QtQuick.Layouts package.

For our first layout object type we begin with ColumnLayout.

A column Layout places things in

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

A layout type doesn't really have a width and a height so you can't do width: parent.width or do so for height. You have to use Layout.fillWidth or Layout.fillHeight.

Just as the name implies they consume, the full width and the full height. If they are other visual object types it shares the space with the other object types and sort of consumes the remaining space.

The spacing property controls the spacing in between the items of the layout.

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

You can use preferredWidth and preferredHeight instead of width and height to set specific dimensions.
