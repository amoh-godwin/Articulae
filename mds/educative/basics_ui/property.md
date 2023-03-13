# Property

We can define our own properties for an object type, provided the properties were declared inside of that type.

## Defining properties

In defining our own property, we use the `property` keyword followed by the type and then by a name you would like to call the property. The type can be any of the QML built-in value types or other supported types.

It will be in the format of:

```qml
property type name
```

You can choose to initialise it with a value, as.

```qml
property type name: value
```

Lets see how you create properties using various types.

### Type: int

The type `int` refers to negative and positive whole numbers. If you use it on a property, the property can therefore only accept positive and negative whole numbers.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {

    property int myWidth: 500

    visible: true
    width: myWidth
    height: 500
    title: "Property"


    Rectangle {

        property int myOrigin

        width: 200
        height: 200
        myOrigin: -100
        x: myOrigin
        color: "dodgerblue"
    }

}
```

In the code above, `myWidth` it was initialised, but `myOrigin` wasn't. `myOrigin` was later set to `-100`.

### Type: real

Type `real` refers to floating point numbers, eg. 3.1413.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Property"


    Rectangle {

        property real angle: 45.5

        y: 150
        x: 150
        width: 200
        height: 200
        rotation: angle
        color: "dodgerblue"
    }

}
```

### Type: bool

Type `bool` refers to boolean values. A boolean value can either be `true` or `false`.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Property"


    Rectangle {

        property bool showing: false

        y: 150
        x: 150
        width: 200
        height: 200
        rotation: 45.5
        color: "dodgerblue"
        visible: showing
    }

}
```

### Type: QtObject

A `QtObject` refers to object types. It can be used to define properties of any object type. 

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Property"


    Rectangle {

        property QtObject rect: Rectangle {x: 50; y: 50; width: 100; height: 100; color: "red" }

        y: 150
        x: 150
        width: 200
        height: 200
        color: "dodgerblue"
        children: [rect]
    }

}
```

### Type: List

A `list` is a container for holding other types. Thereore lists are declared by specifying the type the list will contain.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Property"


    Rectangle {

        property list<QtObject> rects: [
            Rectangle {x: 50; y: 50; width: 100; height: 100; color: "red" },
            Rectangle {x: 25; y: 25; width: 50; height: 50; color: "gold" }
        ]

        y: 150
        x: 150
        width: 200
        height: 200
        color: "dodgerblue"
        children: rects
    }

}
```

But a list is decouraged by QML guidelines. The recommendation is that you use var. All types have binding. Which means, if the value changes, all places where is used get updated. With list, it takes a heavier toll on system resources, so a var is recommended instead.

### Type: var

`var` is equivalent to a JavaScript variable. It can hold any type.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {

    property var myWidth: 500
    property var myTitle: "New Title"
    property var visibility: true
    property var objs: new Object({"width": 100, "height": 500})
    property var bg_colors: ["gold", "green"]

    visible: visibility
    width: myWidth
    height: objs.height
    title: myTitle
    color: bg_colors[0]

}
```

That fact that you can, doesn't say that you should. Apart from a list and a JavaScript object, the default types work better than a var. So, wherein you wouldn't need a list or a JavaScript object, you also wouldn't need a var.
