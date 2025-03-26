# Popup

A popup provides a controls that is drawn with a higher z-index that almost all other controls.

## Basic use

A Popup can be found in the QtQuick.Controls.Basic package. It can be used by calling the Popup object

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Popup"

    Popup {
        anchors.centerIn: parent
        width: 200
        height: 200
        visible: true
    }

}

```

Its modal can be turned on of off by setting the modal property

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Popup"

    Popup {
        anchors.centerIn: parent
        width: 200
        height: 200
        modal: true
        visible: true
    }

}

```

## Z-index

The z-index of a Popup is very high, probably the highest in QML. If you set it manualy you might run into problems like the z-index a ComboBox's popup might fall through.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Popup"

    Rectangle {
        anchors.fill: parent
        color: "gold"
    }

    Rectangle {
        anchors.fill: parent
        color: "teal"
    }

    Rectangle {
        anchors.fill: parent
        color: "gold"
    }

    Rectangle {
        anchors.fill: parent
        color: "teal"
    }

    Popup {
        anchors.centerIn: parent
        width: 200
        height: 200
        modal: true
        visible: true
        z: 1

        ComboBox {
            model: ['first', 'second']
        }

    }

}

```

If you insist on setting the z-index of a Popup, you can fix this problem by also setting the popup of the comboBox to a +1 of whatever the index of the ComboBox itself is.

## Close Policy

There is a closePolicy property, which controls how a popup closes. It is already set to close when there is a press outside of the bounding area of the popup. You can change this behaviour, so that the popup will close when a user clicks outside of the parent of the popup. This way if someone is on settings pane, he/she cannot request a new change in the settings whiles he hasn't accepted or cancelled the current setting he is trying to make, but if he/she chooses to click outside of the settings, then we know that he/she doesn't intend to change any settings so we cancel out and close the popup.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Popup"

    Rectangle {
        anchors.fill: parent
        color: "teal"
    }

    Rectangle {
        anchors.centerIn: parent
        width: 300
        height: 400
        color: "tomato"

        Popup {
            anchors.centerIn: parent
            width: 200
            height: 200
            modal: true
            visible: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

        }
    }

}

```

From the popup above the code will only close if you press outside of its parent.

## Positioning

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 400
    title: "Popup"

    Rectangle {
        anchors.fill: parent
        color: "teal"

        RowLayout {
            width: parent.width
            height: 48

            Button {
                text: "open"

                onClicked: {
                    pop.x = this.x + pop.width > mainWindow.width ? mainWindow.width - pop.width : this.x
                    pop.y = this.y + this.height
                    pop.open()
                }
            }

        }

    }



    Popup {
        id: pop
        width: 200
        height: 200
        modal: true
    }

}

```

[text]

## Tooltip

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 400
    title: "Popup"

    Rectangle {
        anchors.fill: parent
        color: "teal"

        RowLayout {
            width: parent.width
            height: 48

            Button {
                text: "Start"

                ToolTip.visible: hovered
                ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
                ToolTip.text: "This button does amazing things"
                ToolTip.timeout: 2000
            }

        }

    }
}

```

[text]
