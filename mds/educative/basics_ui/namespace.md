# Namespace

We can put our custom type in a seperate folder say **my_customs** right next to the **main.qml**. We could have imported the folder and used types in the folder as:

```qml
import QtQuick
import QtQuick.Controls.Basic
import "./my_customs"

ApplicationWindow {
    visible: true
    width: 500
    height: 500

    MyRoundRect {
        anchors.centerIn: parent
        diameter: 250
        color: "dodgerblue"
    }

}
```

But Qml requires that you namespace the folder first. This is to prevent conflict with other object types that might have the same name.

A folder can be namespaced as:

```qml
import QtQuick
import QtQuick.Controls.Basic
import "./my_customs" as Customs
```

And used as:

```qml
Customs.MyRoundRect {
    ...
}
```

```qml
import QtQuick
import QtQuick.Controls.Basic
import "./my_customs" as Customs

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Namespace"

    Customs.MyRoundRect {
        anchors.centerIn: parent
        diameter: 250
        color: "dodgerblue"
    }

}
```



### Top Properties

Properties of the root object in the top most qml file are available to imported object types with  the use of any id.



Lets define a property borderColor for out top most root object.

```qml
import QtQuick
import QtQuick.Controls.Basic
import "./my_customs" as Customs

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Namespace"

    property color borderColor: "gold"

    Customs.MyRoundRect {
        anchors.centerIn: parent
        diameter: 250
        color: "dodgerblue"
    }

}

```

And now lets use it in our imported qml file without the use of any id.

> my_customs/MyRoundRect.qml

```qml
import QtQuick

Rectangle {
    id: rect

    property int diameter: 100

    width: rect.diameter
    height: rect.diameter
    radius: rect.diameter / 2
    border.width: 8
    border.color: borderColor
}

```

But the other way around is not possible. Properties defined in an imported qml file are not available to the root object.
