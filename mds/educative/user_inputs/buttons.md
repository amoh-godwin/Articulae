# Buttons

[text]

## Basic use

[text]

`code.txt`

[text]

## Changing its look and feel

You can change the width and height of the button.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 400
    height: 400

    Button {
        anchors.centerIn: parent
        text: "Click Me!"
        width: 250
        height: 250

        onClicked: {
            print("Button clicked!")
        }

    }

}
```

 But its color and other properties can only be changed via its background and contentItem properties, which we will study later in this course as button customizations. However you can have a RoundButton, which gives you a round button. It has one added property, the radius property, which you can use to modify the radius of the button. The RoundButton and Button are the same except for the radius property.

`code1.txt`

[text]

## Event handling

[text]

`code2.txt`

[text]

Press and release

[text]

`code3.txt`

[text]

Whereas there is no signal for the hover event, it makes up for it with a property. We believe that a property is efficient in responding to hover events

## Event properties

There is also a property for the press, for a quick alter of the properties.

`code4.txt`

[text]

A button can be disabled, meaning it will not respond to any events except for the hovered property.

`code5.txt`

[text]

If you do not wish for it to respond to hover events turn the visibility off completely, with `visible: false`

The customization of a Button will be studied in a later lesson
