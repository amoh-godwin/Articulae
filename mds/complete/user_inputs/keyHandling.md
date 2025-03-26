# Key Handling

With key handling you can get any key the user presses on the keyboard. But on the keyboards are different types of keys the alphanumerals, the modifiers and the function keys. Lets go on with a basic handling of the keys.

# Basic use

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Key handling"


    Rectangle {
        anchors.centerIn: parent
        width: 300
        height: 200
        color: "dodgerblue"

        focus: true
        Keys.onPressed: (event) => {
            display.text = event.key
        }

        Text {
            anchors.centerIn: parent
            id: display

            color: "white"
            font.pixelSize: 22
        }
    }

}

```

This just shows you the character code representing the unicode of each keyboard characters. Mostly this is not what you want. You can use `event.text` instead of `event.key` to get the actual text of the key.

# Real world use of the event

In the real world you don't just want one word printed whenever you press a new key, but rather you want the new key to be appended to the one you previously type. This is easy actually. Instead of assigning the key we always append.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Key handling"


    Rectangle {
        anchors.centerIn: parent
        width: 300
        height: 200
        color: "dodgerblue"

        focus: true
        Keys.onPressed: (event) => {
            display.text += event.text
        }

        Text {
            anchors.centerIn: parent
            id: display

            color: "white"
            font.pixelSize: 22
        }
    }

}

```

# Getting access to Function keys

We have access to all the function keys. We might not have access to them as f1 and f2 or del key or volume key but we have it all.

Lets see how to implement a real world deletion, whether the backspace was pressed or the del key was pressed.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Key handling"


    Rectangle {
        anchors.centerIn: parent
        width: 300
        height: 200
        color: "dodgerblue"

        focus: true
        Keys.onPressed: (event) => {
            if(event.key == Qt.Key_Backspace) {
                var len = display.text.length
                display.text = display.text.substring(0, len-1)
            } else {
                display.text += event.text
            }

        }

        Keys.onDeletePressed: (event) => {
              var len = display.text.length
              display.text = display.text.substring(0, len-1)
          }

        Text {
            anchors.centerIn: parent
            id: display

            color: "white"
            font.pixelSize: 22
        }
    }

}

```

[text]

# Getting access to the modifiers

Shift key, alt key, ctrl key.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Key handling"


    Rectangle {
        id: display_cont
        anchors.centerIn: parent
        width: 300
        height: 200
        color: "dodgerblue"

        focus: true
        Keys.onPressed: (event) => {

            if((event.key === Qt.Key_A) && (event.modifiers & Qt.ShiftModifier)) {
                display.color = "dodgerblue"
                display_cont.color = "white"

            } else if((event.key === Qt.Key_B) && (event.modifiers & Qt.ControlModifier)) {
                display.color = "orange"
                display_cont.color = "dodgerblue"

            }  else if((event.key === Qt.Key_E) && (event.modifiers & Qt.AltModifier)) {
                display.color = "dodgerblue"
                display_cont.color = "lightgray"

            } else {
                display.text += event.text
            }

        }

        Text {
            anchors.centerIn: parent
            id: display

            color: "white"
            font.pixelSize: 22
        }
    }

}

```

[text]
