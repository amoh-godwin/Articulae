# Customizing A Slider

[text]

## Bacis customization

If you set direct width and height for the slider it will disable the default movements of the handle. So we use the implicit dimension like we have been using.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Custom Slider"


    Slider {
        anchors.centerIn: parent

        background: Rectangle {
            implicitWidth: 240
            implicitHeight: 24
            color: "transparent"
            border.color: "lightgrey"

            Rectangle {
                anchors.centerIn: parent
                width: parent.width
                height: 20
                color: "firebrick"
                radius: height / 2
            }

        }

    }

}

```

Cleary you don't need the border, I added it so you can see.

### Customizing the handle

The visualPosition returns a value from 0 to 1. We can use visualPosition * slider.width, but that will set the x of the handle at the very edge of the slider and the handle will overflow the slider's containter. So we instead substract the width of the handle itself before multiplying it by the visualPositon. 

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Custom Slider"
    color: 'firebrick'


    Slider {
        id: slider
        anchors.centerIn: parent

        background: Rectangle {
            implicitWidth: 240
            implicitHeight: 24
            color: "transparent"

            Rectangle {
                anchors.centerIn: parent
                width: parent.width
                height: 4
                radius: height / 2
            }

        }

        handle: Rectangle {
            x: slider.visualPosition * (slider.width - width)
            y: slider.topPadding
            implicitWidth: 20
            implicitHeight: 20
            radius: width / 2
            color: "firebrick"

            Rectangle {
                anchors.centerIn: parent
                width: parent.width - 6
                height: parent.height - 6
                radius: height / 2
                color: "transparent"
                border.color: "white"
                border.width: 3
            }
        }

    }

}

```

### Modifying the background

But the background itself is usually used to as the progress. With this approach you have to set a direct width and height for the background item and also use the padding properties to set it to the center. You must set the width to the slider's available Width or else the width of the background will overflow the slider boundary.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Custom Slider"
    color: 'firebrick'


    Slider {
        id: slider
        anchors.centerIn: parent

        background: Rectangle {
            x: slider.leftPadding
            y: slider.topPadding + (slider.availableHeight / 2 - height /2)
            implicitWidth: 240
            width: slider.availableWidth
            height: 6
            color: "#25ffffff"
            radius: height / 2

            Rectangle {
                width: parent.width * slider.visualPosition
                height: parent.height
                radius: height / 2
            }

        }

        handle: Rectangle {
            x: slider.visualPosition * (slider.width - width)
            y: slider.topPadding
            implicitWidth: 20
            implicitHeight: 20
            radius: width / 2
            color: "firebrick"

            Rectangle {
                anchors.centerIn: parent
                width: parent.width - 6
                height: parent.height - 6
                radius: height / 2
                color: "transparent"
                border.color: "white"
                border.width: 3
            }
        }

    }

}

```

[text]


