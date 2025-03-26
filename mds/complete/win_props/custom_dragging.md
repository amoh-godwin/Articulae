# Custom Dragging

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
    property bool barPressed

    Rectangle {
        anchors.fill: parent
        color: Qt.lighter("gold", 1.75)


        Rectangle {
            width: parent.width
            height: 32
            color: Qt.lighter("gold", 1.5)

            MouseArea {
                anchors.fill: parent

                onPressed: {
                    prevX = mouseX
                    prevY = mouseY
                   barPressed = true
                }

                onReleased: {
                    barPressed = false
                }

                onMouseXChanged: {
                    if(barPressed) {
                        var diff_x = mouseX - prevX

                        mainWindow.setX(mainWindow.x + diff_x)
                    }

                }
            }

        }

    }


}

```

Then we can apply this understanding to implement dragging along the y-axis also

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
    property bool barPressed

    Rectangle {
        anchors.fill: parent
        color: Qt.lighter("gold", 1.75)


        Rectangle {
            width: parent.width
            height: 32
            color: Qt.lighter("gold", 1.5)

            MouseArea {
                anchors.fill: parent

                onPressed: {
                    prevX = mouseX
                    prevY = mouseY
                   barPressed = true
                }

                onReleased: {
                    barPressed = false
                }

                onMouseXChanged: {
                    if(barPressed) {
                        var diff_x = mouseX - prevX

                        mainWindow.setX(mainWindow.x + diff_x)
                    }

                }

                onMouseYChanged: {
                    if(barPressed) {
                        var diff_y = mouseY - prevY

                        mainWindow.setY(mainWindow.y + diff_y)
                    }
                }
            }

        }

    }


}

```

[text]
