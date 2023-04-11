# Buttons

Buttons provide users with a clickable control that performs some functions after they have been clicked.

## Basic use

To get a button in your application all you have to do is to import it from the QtQuick.Controls.Basic package and call it as you would any Qml object type.

`code.txt`

## Changing its look and feel

You can change the width and height of the button to suit your preference.

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

You can see from the example above that the radius property was used to change the radius of the button.

## Event handling

There are numerous events that take place with button. Events like when a button is clicked, pressed, released, and so. Signals get triggered or emitted when these events take place, so you respond to these events using their corresponding signal handlers.

`code2.txt`

Handling pressed and released events

`code3.txt`

Whereas there is no signal for the hover event, it makes up for it with a property. We believe that a property is efficient in responding to hover events

## Event properties

There is also a property for the press, this is so you can do a styling of the button to indicate that it has been pressed.

`code4.txt`

A button can be disabled, meaning it will not respond to any event except that the hovered property will still respond to hovering.

`code5.txt`

If you do not wish for it to respond to hover events turn the visibility off completely, with `visible: false`

The customization of a Button will be studied in a later lesson
