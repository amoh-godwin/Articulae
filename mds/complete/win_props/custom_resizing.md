# Custom Resizing

[text]

## Vertical resizing

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 308
    height: 308
    flags: Qt.FramelessWindowHint | Qt.Window

    property int prevX
    property int prevY
    property bool dragPressed

    Rectangle {
        anchors.fill: parent
        color: Qt.lighter("gold", 1.75)


        Rectangle {
            width: parent.width
            height: 32
            color: Qt.lighter("gold", 1.5)
        }


        Rectangle {
            width: parent.width
            height: 1
            anchors.bottom: parent.bottom
            color: "lightsteelblue"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeVerCursor

                onPressed: {
                    dragPressed = true
                }

                onReleased: {
                    prevX = mouseX
                    prevY = mouseY
                    dragPressed = true
                }

                onMouseYChanged: {
                    if(dragPressed) {
                        var diff_y = mouseY - prevY
                        mainWindow.setHeight(mainWindow.height + diff_y)
                    }
                }

            }

        }

    }


}

```

## Horizontal resizing

Then do it for the horizontal resizing

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 308
    height: 308
    flags: Qt.FramelessWindowHint | Qt.Window

    property int prevX
    property int prevY
    property bool dragPressed

    Rectangle {
        anchors.fill: parent
        color: Qt.lighter("gold", 1.75)


        Rectangle {
            width: parent.width
            height: 32
            color: Qt.lighter("gold", 1.5)
        }

        Rectangle {
            width: 1
            height: parent.height
            anchors.left: parent.left
            color: "lightsteelblue"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeHorCursor

                onPressed: {
                    dragPressed = true
                }

                onReleased: {
                    prevX = mouseX
                    dragPressed = true
                }

                onMouseXChanged: {
                    if(dragPressed) {
                        var diff_x = mouseX - prevX
                        mainWindow.setWidth(mainWindow.width - diff_x)
                        mainWindow.setX(mainWindow.x + diff_x)
                    }
                }

            }

        }

        Rectangle {
            width: 1
            height: parent.height
            anchors.right: parent.right
            color: "lightsteelblue"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeHorCursor

                onPressed: {
                    dragPressed = true
                }

                onReleased: {
                    prevX = mouseX
                    dragPressed = true
                }

                onMouseXChanged: {
                    if(dragPressed) {
                        var diff_x = mouseX - prevX
                        mainWindow.setWidth(mainWindow.width + diff_x)
                    }
                }

            }

        }


        Rectangle {
            width: parent.width
            height: 1
            anchors.bottom: parent.bottom
            color: "lightsteelblue"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeVerCursor

                onPressed: {
                    dragPressed = true
                }

                onReleased: {
                    prevY = mouseY
                    dragPressed = true
                }

                onMouseYChanged: {
                    if(dragPressed) {
                        var diff_y = mouseY - prevY
                        mainWindow.setHeight(mainWindow.height + diff_y)
                    }
                }

            }

        }

    }


}

```

[text]



```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 308
    height: 308
    flags: Qt.FramelessWindowHint | Qt.Window

    property int prevX
    property int prevY
    property bool dragPressed

    Rectangle {
        anchors.fill: parent
        color: Qt.lighter("gold", 1.75)


        Rectangle {
            width: parent.width
            height: 32
            color: Qt.lighter("gold", 1.5)
        }

        Rectangle {
            width: 1
            height: parent.height
            anchors.left: parent.left
            color: "transparent"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeHorCursor

                onPressed: {
                    dragPressed = true
                }

                onReleased: {
                    prevX = mouseX
                    dragPressed = true
                }

                onMouseXChanged: {
                    if(dragPressed) {
                        var diff_x = mouseX - prevX
                        mainWindow.setWidth(mainWindow.width - diff_x)
                        mainWindow.setX(mainWindow.x + diff_x)
                    }
                }

            }

        }

        Rectangle {
            width: 1
            height: parent.height
            anchors.right: parent.right
            color: "transparent"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeHorCursor

                onPressed: {
                    dragPressed = true
                }

                onReleased: {
                    prevX = mouseX
                    dragPressed = true
                }

                onMouseXChanged: {
                    if(dragPressed) {
                        var diff_x = mouseX - prevX
                        mainWindow.setWidth(mainWindow.width + diff_x)
                    }
                }

            }

        }


        Rectangle {
            width: parent.width
            height: 1
            anchors.bottom: parent.bottom
            color: "transparent"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeVerCursor

                onPressed: {
                    dragPressed = true
                }

                onReleased: {
                    prevY = mouseY
                    dragPressed = true
                }

                onMouseYChanged: {
                    if(dragPressed) {
                        var diff_y = mouseY - prevY
                        mainWindow.setHeight(mainWindow.height + diff_y)
                    }
                }

            }

        }

    }


}

```

[text]
