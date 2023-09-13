# Buttons

A `Button` is a visual item that responds to mouse events such as click and hover. It perform functions after it has been clicked.

## Basic use[](https://www.educative.io/pageeditor/6586453712175104/6144552105934848/6610077336469504#Basic-use)

To get a button in your application all you have to do is to import it from the `QtQuick.Controls.Basic` package and call it as you would call any QML object type.

`code.txt`

From the code above, from **lines 9 to 17** we have a `Button` that prints “Button Clicked!” when the button has been clicked.

## Changing its look and feel[](https://www.educative.io/pageeditor/6586453712175104/6144552105934848/6610077336469504#Changing-its-look-and-feel)

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

## Event handling[](https://www.educative.io/pageeditor/6586453712175104/6144552105934848/6610077336469504#Event-handling)

There are numerous events that take place with button. Events like when a button is `clicked`, `pressed`, `released`, and so. Signals get triggered or emitted when these events take place, so you respond to these events using their corresponding signal handlers.

Lets see these events signals in action.

- Handling `pressAndHold` and `doubleClicked` signals

`code2.txt`

- Handling `pressed` and `released` events

`code3.txt`

## Event properties[#](https://www.educative.io/pageeditor/6586453712175104/6144552105934848/6610077336469504#Event-properties)

Whereas there is no signal for the hover event, it makes up for it with the `hovered` property. We believe that this property is efficient in responding to hover events. There is also a property for the `pressed` event, this is so you can do the styling of the button to indicate that it has been pressed.

`code4.txt`

A `Button` can be disabled, meaning it will not respond to any event except that the `hovered` property will still respond to hovering.

`code5.txt`

If you do not wish for it to respond to hover events turn the visibility off completely, with `visible: false`. This way the button itself will not be visible.

The customization of a `Button` will be studied in a later lesson
