# ScrollView

A Scrollview will calculate the actual content width and height of the content.

## Basic use

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 500

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: "lightgrey"
            }

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    Layout.preferredWidth: 200
                    Layout.fillHeight: true
                }

                ScrollView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Image {
                        sourceSize: Qt.size(parent.width, parent.height)
                        source: "../images/pexels-araz-yurtseven-12531788.jpg"
                    }

                }


            }

        }

    }



}
```

If you wot need it, the scroolbar for that part wont show up.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 500

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: "lightgrey"
            }

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    Layout.preferredWidth: 200
                    Layout.fillHeight: true
                }

                ScrollView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Image {
                        sourceSize.width: 600
                        source: "../images/pexels-araz-yurtseven-12531788.jpg"
                    }

                }

            }

        }

    }

}
```

There are scrollbar attached properties which can be used to modify the scrollbars of the scrollview.

## Interactiveness

The scrollbars of the Scrollview can be made to not show or we can disable interativeness of them.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 500

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: "lightgrey"
            }

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    Layout.preferredWidth: 200
                    Layout.fillHeight: true
                }

                ScrollView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Image {
                        source: "../images/pexels-araz-yurtseven-12531788.jpg"
                        fillMode: Image.PreserveAspectFit
                    }

                    ScrollBar.vertical.policy: ScrollBar.AlwaysOff
                    ScrollBar.horizontal.interactive: false

                }


            }

        }

    }



}
```

Notice scrolling still works for the view, because only the bars have been modified.

You can set the horizontal bar off with: `ScrollBar.vertical.policy: ScrollBar.AlwaysOff`, and can also disable the interactiveness for the vertical bar with: `ScrollBar.horizontal.interactive: false`.
