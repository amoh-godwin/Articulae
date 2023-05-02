# MouseArea

* basic use - with onclicked
  
  `code.txt` - A basic application with a clickable rectangle

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

`code1.txt`

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
  
  `code2.txt`
  
  In the code above we use a forbidden cursor.

* pressed

        When the button is down, the signal that is emitted is the pressed signal, you can get the pressed button by using the `pressedButtons` property. If the value is 1 the left button was pressed, if the value is 2 then the right button was pressed.

`code3.txt`

* released
  
  with this you can use the mouse object to get which button was pressed and then released
  
  `code4.txt`

* onPressAndHold
  
  There is a signal for when the user presses and hold the button.
  
  Typically it takes 1 second for the signal to be emitted.  But you can control how long it takes the signal to be emitted by setting the pressAndHoldInterval property. The value should be in milliseconds. With this signal too, you can access the `pressedButtons` property
  
  `code5.txt`

* doubleClicked
  
  And of course there is a doubleClicked signal
  
  `code6.txt`

* onPositionChanged
  
  You can use mouseX and mouseY to get.
  
  `code7.txt`.
  
  You can also use mouse.x but with that you have to declare mouse first to prevent any deprecated warnings
  
  `code8.txt`

* wheel
  
  The wheel signal is emitted for the mouse wheel and also for the trackpad.
  
  `code9.txt`

## Handling modifiers

  You can use the mouse objec to get which keyboard modifier was pressed.

  `code10.txt`

  But ofcourse we can also handle key presses. Let us discuss that in the next lesson.
