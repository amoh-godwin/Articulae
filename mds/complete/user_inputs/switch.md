# Switch

A Switch is a toggle button that can be toggled on or off.

## Basic use

A Switch is found in the QtQuick.Controls package.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400

    Switch {
        text: "On"
    }

}

```

When you run the above code, you will see that the text is displayed right next to the switch button. A Switch is useful for stuff like Hardware interface toggles like, wifi, bluetooth, etc. If you would need a lot of switches you should use a SwitchDelegate instead.

## Using a switch delegate

A Switch delegate can be used with any item or object type that requires a delegate.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400

    ListView {
        anchors.centerIn: parent
        width: 200
        height: parent.height -48

        model: ["Base", "Treble", "Soprano"]
        delegate: SwitchDelegate {
            width: ListView.view.width
            text: modelData
        }

    }

}

```

A SwitchDelegate can be modified further to create the desired effect.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400

    ListView {
        anchors.centerIn: parent
        width: 200
        height: parent.height -48

        model: ["Base", "Treble", "Soprano"]
        delegate: SwitchDelegate {
            width: ListView.view.width
            text: modelData

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: "tomato"
            }

        }

    }

}

```

In the above code playground, we just added a Rectangle as border for the SwitchDelegate. I hope you can see that you we could have done more to it.

## Using the toggle signal

We can use the `position` property to determine whether the switch is turned on or off. The position property returns a number between 0.0 and 1.0. There is a toggle signal which only get emitted whether the Switch has been turned on or off. So, handling the signal we will only get values 0 or 1 for the position property, and we can use that to run any functions we want to run the the switch gets turned on or off.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400

    Switch {
        text: "On"

        onToggled: {
            if(this.position) {
                print("You have turned on the mixer")
            }
        }
    }

}

```

You can also use the checked property which is not exclusive to the Switch button to determine if the switch has been turned on or off it returns true or false.

## Customization

We can also customize a Switch for the look that we want.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400

    Switch {
        anchors.centerIn: parent
        id: stch
        text: "On"

        indicator: Rectangle {
            implicitWidth: 48
            implicitHeight: 26
            radius: 13
            color: stch.checked ? "teal": "white"
            border.color: "black"

            Rectangle {
                x: (parent.width - width) * stch.visualPosition
                y: 1
                width: 24
                height: 24
                radius: 12
                border.color: "black"
            }

        }
    }

}

```

Apart from the inidicator and the contentItem, we could have also customised the background as well.
