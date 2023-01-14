# Custom Types

You can create your own object types that can be imported into other qml files as:

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500

    MyOwnRectangle {
        anchors.fill: parent
    }

}
```

The approach is:

* You have to build on top of an already existing object type

* You import that type in a separate file

* You update or improve upon it. You can even include multiple object types

* Your filename will become the name of your type. So a filename MyOwnRectangle.qml will become a type MyOwnRectangle
- Your file name will strictly have to start with an upper case letter

Lets build a custom type.

Lets say we decide on building on top of `Rectangle`.

We can turn a square into a circle provided the `radius` is half of one of its sides.

```qml
import QtQuick

Rectangle {
    id: rect

    property int diameter: 100

    width: rect.diameter
    height: rect.diameter
    radius: rect.diameter / 2
}
```

Call it **MyRoundRectangle.qml**

Now import it in a normal qml file say **main.qml**

To import it without specifying any import statement. The **MyRoundRect.qml** must be in the same folder as **main.qml**.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Custom"

    MyRoundRect {
        anchors.centerIn: parent
        diameter: 250
        color: "dodgerblue"
    }

}
```

You can see we can specify the `diameter`, our newly added property and `color` which is an old property of the inherited type `Rectangle`.

This method of customisation can be employed to organise our code to make it more maintainable.
