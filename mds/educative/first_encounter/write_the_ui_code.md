# Write the UI code

In this section you will be having your first encounter with creating GUIs. You don't understand the code yet, but I want you to get a feel of how simple it is to create a GUI.

We will be writing the UI code first and then connect the UI code to python.

* Create a new file anywhere on your computer and call it `main.qml`.

* Open it and write the following code in it:
  
  main.qml
  
  ```qml
  import QtQuick
  import QtQuick.Controls.Basic
  
  ApplicationWindow {
      visible: true
      width: 600
      height: 400
      title: "Python GUI | Welcome"
  
      Text {
          id: wlc_text
          anchors.centerIn: parent
          text: "Welcome"
          font.pixelSize: 48
          color: "dimgrey"
          opacity: 0
      }
  
      SequentialAnimation {
  
          running: true
          loops: 1000
  
          OpacityAnimator {
              target: wlc_text
              from: 0
              to: 1
              duration: 1000
              running: true
          }
  
          OpacityAnimator {
              target: wlc_text
              from: 1
              to: 0
              duration: 1000
              running: true
          }
      }
  
  }
  
  ```

The code above is less than 45 lines and it includes animation.

Now lets preview this code even before we connect it to Python.
