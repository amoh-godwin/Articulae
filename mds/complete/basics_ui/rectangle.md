# Rectangle

The next UI element on the popularity chart is the `Rectangle`. It is found in the `QtQuick` package.

A `Rectangle` requires that both of its `width` and `height` properties must be set explicitedly or implicitedly, otherwise the `Rectangle` will not draw.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Rectangle"
    color: "dimgrey"

    Rectangle {
        width: 300
        height: 300
    }

}
```

You can see that the background of the window is dimgrey. The Rectangle's color like every other Visual item is set to white by default.

## Color

The color property, like I have stated, is not exclusive to a Rectangle and an ApplicationWindow. The color property takes a color type and not a string. You can set it to a SVG color name, a hexadecimal triplet, or quad code, or using any of Qt.rgba(), Qt.hsva(), Qt.hsla(), Qt.darker(), Qt.lighter() or Qt.tint() functions.

An SVG color name:

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Rectangle"
    color: "dimgrey"

    Rectangle {
        width: 300
        height: 300
        color: "dodgerblue"
    }

}
```

A hexadecimal code:

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Rectangle"

    Rectangle {
        width: 300
        height: 300
        color: "#527236"
    }

}
```

A hexadecimal code with transparency. The transparency is a percentage value, from 01 to 99. It is written after the # character but it precedes the 6 digit color code.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Rectangle"

    Rectangle {
        width: 300
        height: 300
        color: "#77527236"
    }

}
```

Using Qt.rgba

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Rectangle"

    Rectangle {
        width: 300
        height: 300
        color: Qt.rgba(52,72,36,0.7)
    }

}
```

## Color - new

The color property, like I have stated, is not exclusive to a Rectangle and an ApplicationWindow. The `color` property takes a `color` type and not a string. You can set it to a SVG color name, a hexadecimal triplet, or quad code, or using any of `Qt.rgba`, `Qt.hsva`, `Qt.hsla`, `Qt.darker`, `Qt.lighter` or `Qt.tint` functions.

* An SVG color name - These are 256 defined color names mainly for the web. It includes popular color names such as: red, green, blue and some other new names as teal and dodgerblue. Eg.: `color: "teal"`

* A hexadecimal code - These are alphanumeric characters in the length of six, used to represent color. They are in batches of two. The first two will represent the type of red, the middle will represent the type of green and the last two would represent  the type of blue. The two numbers can be `00` - `99` or `aa` - `ff`. In QML, you begin writing them with a hash/number symbol (#). Eg.: `color: "#ff2800"`

* A hexadecimal code with transparency percentage - You can begin the hexadecimal code with a transparency percentage. With `00` being 0 percent, `99` being 99 percent. You can remove them entirely to get a 100 percent. Eg. `color: "#97ff2800"`

* The `Qt.rgba` method - This method accepts four `int` parameters, the first for red value, the second for the green value, the third for the blue value, and the last one is a value between zero and one for the alpha value. The alpha value is the transparency percentage written as a decimal, `0.0` as 0 percent, `0.50` as 50 percent and `1.0` as 100 percent. Eg.: `color: Qt.rgba(77, 43, 23, 0.85)`

## Radius

Rectangle has a radius, that makes the edges round.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Rectangle"

    Rectangle {
        width: 300
        height: 300
        color: "dodgerblue"
        radius: 8
    }

}
```

It appears that the radius functions as if the Rectangle were to be a circle. In that, if you specify the radius to be half the width and height of the Rectangle, it turns the Rectangle into a perfect circle, much like a radius is in the drawing of a circle.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Rectangle"

    Rectangle {
        width: 300
        height: 300
        color: "dodgerblue"
        radius: 150
    }

}
```

## Border

Rectangle has a border. You can specify, just the width, or just the color, in that case the defaults of the unset will apply, which are 1 and black respectively.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Rectangle"

    Rectangle {
        width: 300
        height: 300
        color: "dodgerblue"
        radius: 150
        border.color: "gold"
        border.width: 10
    }

}
```

## Opacity

There is also an opacity property. It takes a number between 0 and 1. 1 being fully opaque and 0 being fully transparent.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Rectangle"

    Rectangle {
        width: 300
        height: 300
        color: "dodgerblue"
        radius: 150
        border.color: "gold"
        border.width: 10
        opacity: 0.5
    }

}
```

## Rotation

There is also a rotation property.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Rectangle"

    Rectangle {
        width: 300
        height: 300
        color: "dodgerblue"
        rotation: 45
    }

}
```

## Visibillity

There is the visible property.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Rectangle"

    Rectangle {
        width: 300
        height: 300
        color: "dodgerblue"
        visible: false
    }

}
```

## Stacking

If a Visual object is placed in the same parent as another without any layout. The last visual object will be drawn on top of the first one.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Rectangle"

    Rectangle {
        width: 300
        height: 300
        color: "dodgerblue"
        rotation: 45
    }

    Rectangle {
        width: 300
        height: 300
        color: "gold"
        opacity: 0.5
    }

}
```

In some cases, this is what you want to achieve, but most of the times you would want put it in a layout.
