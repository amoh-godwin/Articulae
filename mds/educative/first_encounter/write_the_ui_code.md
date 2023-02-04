# Write the UI code

In this section you will be having your first encounter with creating GUIs.

Because we are using the Top-Down software engineering approach, we will be writing the UI code first before we connect it to python. Because this will just be an introduction, we will do very little in python.

You won't understand the code yet, but I want you to get a feel of how simple it is to create a GUI.

Follow these steps:

* Create a new file and call it `main.qml`.

* Open it and write the following code in it:
  
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

The code above is less than 45 lines.

* We create a window with a width of 600 and a height of 400

* We give it a title of "Python Gui | Welcome"

* We add text that says "Welcome"

* We center the text in the center of the Window

* Then we add an Animation that fades in the text, and then fade out the text.

* We repeat that sequence a 1000 times.

Now lets preview this code even before we connect it to Python.
