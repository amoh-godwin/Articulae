# MouseArea

* basic use - with onclicked
  
  ```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 400
    height: 400

    Rectangle {
        id: rect
        width: 120
        height: 48
        color: "dodgerblue"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                rect.color = "yellow"
            }
        }
    }

}

``` - A basic application with a clickable rectangle

* accepted buttons
  
  With the above code only the left button is clickable. You can also make the right button too clickable.
  
  
  
  ```qml
  ...
  
          MouseArea {
              anchors.fill: parent
              acceptedButtons: Qt.LeftButton | Qt.RightButton
              onClicked: {
                  rect.color = "yellow"
              }
          }
  ...
  ```

```
Or we could have simply used `Qt.AllButtons`.

* hoverEnabled

We can enable the hover and then use the onEntered and onExited signals to respond to hover options

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 400
    height: 400

    Rectangle {
        id: rect
        width: 120
        height: 48
        color: "dodgerblue"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                rect.color = "yellow"
            }

            onExited: {
                rect.color = "dodgerblue"
            }
        }
    }

}

```

or we can choose to set a hovered property on the `Rectangle` instead

```qml
...

    Rectangle {
        id: rect

        property bool hovered: false

        width: 120
        height: 48
        color: hovered ? "yellow" : "dodgerblue"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                rect.hovered = true
            }

            onExited: {
                rect.hovered = false
            }
        }
    }

...
```

* cursorShape
  
  The shape of the cursor can be changed. Perhaps you want to change the cursor to reflect what action or actions a user can perform using your custom control.
  
  Accepted values are:
  
  Qt.ArrowCursor
  Qt.UpArrowCursor
  Qt.CrossCursor
  Qt.WaitCursor
  Qt.IBeamCursor
  Qt.SizeVerCursor
  Qt.SizeHorCursor
  Qt.SizeBDiagCursor
  Qt.SizeFDiagCursor
  Qt.SizeAllCursor
  Qt.BlankCursor
  Qt.SplitVCursor
  Qt.SplitHCursor
  Qt.PointingHandCursor
  Qt.ForbiddenCursor
  Qt.WhatsThisCursor
  Qt.BusyCursor
  Qt.OpenHandCursor
  Qt.ClosedHandCursor
  Qt.DragCopyCursor
  Qt.DragMoveCursor
  Qt.DragLinkCursor
  
  ```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 400
    height: 400

    Rectangle {
        id: rect

        property bool hovered: false

        width: 120
        height: 48
        color: hovered ? "yellow" : "dodgerblue"

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.ForbiddenCursor
        }
    }

}

```
  
  In the code above we use a forbidden cursor.

* pressed

        When the button is down, the signal that is emitted is the pressed signal, you can get the pressed button by using the `pressedButtons` property. If the value is 1 the left button was pressed, if the value is 2 then the right button was pressed.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 400
    height: 400

    Rectangle {
        id: rect

        property bool hovered: false
        property string text: ""

        width: 120
        height: 48
        color: "dodgerblue"

        Text {
            anchors.centerIn: parent
            text: rect.text
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.AllButtons

            onPressed: {
                rect.color = "green"
                rect.text = pressedButtons
            }
        }
    }

}

```

* released
  
  with this you can use the mouse object to get which button was pressed and then released
  
  ```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 400
    height: 400

    Rectangle {
        id: rect

        property bool hovered: false
        property string text: ""

        width: 120
        height: 48
        color: "dodgerblue"

        Text {
            anchors.centerIn: parent
            text: rect.text
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.AllButtons

            onReleased: (mouse) => {
                rect.text = mouse.button
            }
        }
    }

}

```

* onPressAndHold
  
  There is a signal for when the user presses and hold the button.
  
  Typically it takes 1 second for the signal to be emitted.  But you can control how long it takes the signal to be emitted by setting the pressAndHoldInterval property. The value should be in milliseconds. With this signal too, you can access the `pressedButtons` property
  
  ```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 400
    height: 400

    Rectangle {
        id: rect

        property bool hovered: false
        property string text: ""

        width: 120
        height: 48
        color: "dodgerblue"

        Text {
            anchors.centerIn: parent
            text: rect.text
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.AllButtons
            pressAndHoldInterval: 2000

            onPressAndHold: {
                rect.text ="You pressed and held"
            }

        }
    }

}

```

* doubleClicked
  
  And of course there is a doubleClicked signal
  
  ```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 400
    height: 400

    Rectangle {
        id: rect

        property bool hovered: false
        property string text: ""

        width: 120
        height: 48
        color: "dodgerblue"

        Text {
            anchors.centerIn: parent
            text: rect.text
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onDoubleClicked: {
                rect.text ="You double clicked me"
            }

        }
    }

}

```

* onPositionChanged
  
  You can use mouseX and mouseY to get.
  
  ```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 400
    height: 400

    Rectangle {
        id: rect
        anchors.centerIn: parent

        property bool hovered: false
        property string text: ""

        width: 240
        height: 50
        color: "dodgerblue"

        Text {
            anchors.centerIn: parent
            text: rect.text
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onPositionChanged: {
                rect.text ="MouseX: " +mouseX+ "; MouseY: "+mouseY
            }

        }
    }

}

```.
  
  You can also use mouse.x but with that you have to declare mouse first to prevent any deprecated warnings
  
  ```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 400
    height: 400

    Rectangle {
        id: rect
        anchors.centerIn: parent

        property bool hovered: false
        property string text: ""

        width: 240
        height: 50
        color: "dodgerblue"

        Text {
            anchors.centerIn: parent
            text: rect.text
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onPositionChanged: (mouse) => {
                rect.text ="MouseX: " +mouse.x+ "; MouseY: "+mouse.y
            }

        }
    }

}

```

* wheel
  
  The wheel signal is emitted for the mouse wheel and also for the trackpad.
  
  ```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 400
    height: 400

    Rectangle {
        id: rect
        anchors.centerIn: parent

        property bool hovered: false
        property string text: ""

        width: 240
        height: 50
        color: "dodgerblue"

        Text {
            anchors.centerIn: parent
            text: rect.text
            color: "white"
        }

        Text {
            id: second_text
            anchors.top: parent.children[0].bottom
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onWheel: (mouse) => {
                rect.text ="MouseX: " +mouse.x+ "; MouseY: "+mouse.y
                second_text.text = "Angel: " + mouse.angleDelta + "; Pixel: " + mouse.pixelDelta
            }

        }
    }

}

```

## Handling modifiers

  You can use the mouse objec to get which keyboard modifier was pressed.

  `code10.txt`

  But ofcourse we can also handle key presses. Let us discuss that in the next lesson.
