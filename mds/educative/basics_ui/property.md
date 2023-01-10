# Property

We can define our own properties inside of an object type.

In defining our own custom types, we use the `property` keyword followed by the type and then by the name. `myWidth` value was initialized with `300`, we say initialized because you can always reset it. And `newTitle` was later set before it was used.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {

    property int myWidth: 300
    property string newTitle

    visible: true
    width: myWidth
    height: 500
    newTitle: "Something else"
    title: newTitle

}


```


