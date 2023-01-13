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


