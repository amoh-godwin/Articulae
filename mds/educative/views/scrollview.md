# ScrollView

A `ScrollView` provides scrolling functionality for its content.

A `ScrollView` will calculate the actual `width` and `height` of the content and provide scrolling if its dimensions exceeds the dimensions of the `ScrollView`.

## Basic use

A `ScrollView` is found in the `QtQuick.Controls` package. The item that needs scrolling must be placed directly inside the `ScrollView`.

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

A basic implementation of a ScrollView with an Image as its child

If say, only the height of an item exceeds the `ScrollView`, a scroll bar will only show up for the height. If a scroll bar shows up for a width also, then the `width` also exceeds the `ScrollView`, other than that there wouldn’t be any scroll bar for that side.

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

A ScrollView with a child that needs scrolling only for one side

There are `ScrollBar` attached properties that can be used to modify the scroll bars of the `ScrollView` further.

## ScrollBar’s attached properties

We can explicitedly turn off any scroll bar that we don’t want to show, or we can disable the interactiveness of a `Scrollbar` so that it shows up, but it cannot be interacted with, as to scroll to a particular position. But the scrolling functionality will still work both for the one we made not to show and the one with interactiveness disabled. But a word of caution here, scrolling might be difficult or impossible for those with only a mouse and not touch interface. To be sure there will be scrolling for non-touch interfaces as well, you should only set the interactiveness to `false`.

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

A ScrollView with its scroll bars modified

Notice scrolling still works for the view, because only the bars have been modified.

You can set the horizontal bar off with: `ScrollBar.horizontal.policy: ScrollBar.AlwaysOff`, and can also disable the interactiveness for the vertical bar with: `ScrollBar.vertical.interactive: false`.
