# ID

Properties and methods of all object types can be called from a function or from another type using its id (identifier). There are two types of ids, pre-defined and custom ids. Pre-defined ids are `parent` and `children`. The `children` id is not always available, so it is least used.

### Using the parent

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500

    Rectangle {
        width: parent.width
        height: 50
        color: "dodgerblue"
    }

}
```

### Using the children

children is plurar. It is always a list, so if the is only one child. You call it using the first index.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500

    Rectangle {
        width: 500
        height: 50
        color: children[0].color

        Rectangle {
            width: 50
            height: 50
            color: "gold"
            visible: false
        }

    }

}
```

### Using a custom id.

A custom id can also be set using the `id` property. It must start with a lower case letter or underscore.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: rect01.someTitle
    color: rect01.color

    Rectangle {

        property string someTitle: "Beautiful title"

        id: rect01
        width: 500
        height: 50
        color: "dodgerblue"
        border.color: "gold"
    }

}
```

However, the properties of the top most object type can be accessed by the other object types without specifying any id at all.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "IDs, pre-defined and custom"
    color: "dimgrey"

    property int myWidth: 200

    Rectangle {
        id: rect01
        width: 500
        height: 300
        color: "dodgerblue"

        Rectangle {
            width: 500
            height: 200
            color: "teal"

            Rectangle {
                width: myWidth
                height: 100
                color: "pink"
            }

        }


    }

}

```

If the object type itself has another property by that same name, the object's own property will be used instead.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "IDs, pre-defined and custom"
    color: "dimgrey"

    property int myWidth: 200

    Rectangle {
        id: rect01
        width: 500
        height: 300
        color: "dodgerblue"

        Rectangle {
            width: 500
            height: 200
            color: "teal"

            Rectangle {

                property int myWidth: 24

                width: myWidth
                height: 100
                color: "pink"
            }

        }


    }

}

```

In that case, you should specify an id.
