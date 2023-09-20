# Buttons

A `Button` is a visual item that responds to mouse events such as click and hover. It perform functions after it has been clicked.

## Basic use

To get a `Button` in your application all you have to do is to import it from the `QtQuick.Controls.Basic` package and call it as you would call any QML object type.

`code.txt`

From the code above, from **lines 9 to 17** we have a `Button` that prints “Button Clicked!” when the button has been clicked.

## Changing its look and feel

You can change the `width` and `height` of the button to suit your preference.

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

But its `color` and other properties can be changed only via its `background` and `contentItem` properties, which we will study later in this course as button customizations. However you can have a `RoundButton`, which gives you a round button. It has one added property, the `radius` property, which you can use to modify the radius of the button. The `RoundButton` and `Button` are the same except for the `radius` property. Lets see this in playground below.

`code1.txt`

You can see from the example above in **line 12** that the `radius` property was used to change the radius of the button.

## Event handling

There are numerous events that take place with button. Events like when a button is `clicked`, `pressed`, `released`, and so. Signals get triggered or emitted when these events take place, so you respond to these events using their corresponding signal handlers.

Lets see these events signals in action.

- Handling `pressAndHold` and `doubleClicked` signals. When a `Button` is pressed down for more that a second a `pressAndHold` signal is emitted. Also when it is double clicked is less than a second a `doubleClicked` signal is emitted. Lets see how to handle these two signals. Take a look at the code below we have implement [text]

`code2.txt`

- Handling `pressed` and `released` events. When a `Button` is held down, before its released the `pressed` signal is emitted, and when the button is let go as in it has been released the `released` signal is emitted. Lets see how we handle these two signals also. See line [text] of the code below.

`code3.txt`

## Event properties

Whereas there is no signal for the hover event, it makes up for it with the `hovered` property. We believe that this property is efficient in responding to hover events. There is also a property for the `pressed` event, this is so you can do the styling of the `Button` to indicate that it has been pressed.

`code4.txt`

A `Button` can be disabled, meaning it will not respond to any event except that the `hovered` property will still respond to hovering events. We do this by setting `enabled` to `false`. See **line 24** of the code below.

`code5.txt`

If you do not wish for it to respond to hover events turn the visibility off completely, with `visible: false`. This way the `Button` itself will not be visible.
