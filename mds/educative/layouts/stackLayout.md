# StackLayout

Learn how to lay out items using a StackLayout.

## Introduction

Normally, visual object types not placed in any `Layout` type, stack on top of each. They are not placed side by side or one on top and one below. They are all placed at cordinates `x:0` and `y:0` of the window. It can happen that this is what you want. You can use it to create a custom popup where a user is prompted to do something before he continues with the app. But to fully benefit from the advantages of using a well managed layout you can use a StackLayout.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "StackLayout"

    Rectangle {
        width: 400
        height: 200
        color: "dodgerblue"

    }

    Rectangle {
        width: 400
        height: 200
        color: "tomato"
    }

    Rectangle {
        width: 400
        height: 200
        color: "dimgrey"
    }

    Rectangle {
        width: 400
        height: 200
        color: "gold"
    }

    Rectangle {
        width: 400
        height: 200
        color: "lightgrey"
    }



}
```

## Basic use

With items that are not placed in any layout, the last last to be written will be shown on top. But with `StackLayout`, by default the item that will be shown on top is the one that is written first inside the `StackLayout`. StackLayout also offers you the opportunity to choose which item is shown through indexing. Without the StackLayout, you would have had to give each of the items an `id` and then toggle their visibility using later on. You can set which item is shown by setting the `currrentIndex` property Take a look at line 13 of the code below you can see that we have set the currentIndex to 2, which is the third Rectangle in the StackLayout. If you set the `currentIndex` to any index out of range nothing will not be drawn.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "GridLayout"

    StackLayout {
        anchors.fill: parent
        currentIndex: 2

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "dodgerblue"

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "tomato"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "dimgrey"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "gold"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "lightgrey"
        }

    }

}
```

## Attached properties

All of the properties can be set/changed dynamically, so there is an attached property that lets you know if the item is the one currently displayed, the property `isCurrentItem`. In the code below you can see that it has been used in line 31.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 500
    title: "GridLayout"

    StackLayout {
        anchors.fill: parent
        currentIndex: 2

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "dodgerblue"

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "tomato"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: StackLayout.isCurrentItem ? "dodgerblue" : "dimgrey"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "gold"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "lightgrey"
        }

    }

}
```

## The value-assignment statement

The `?`, `:` is a shorthand conditional value-assignment statement. It is in the format of:

`variable: condition ? trueValue : falseValue`.

So a variable's value will change based on whether the condition is true or false. Not there will always be a value, because even if the condition is false the false value will be assigned. In this case, the condition is, if `Stack.isCurrentItem`.
