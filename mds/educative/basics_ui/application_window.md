# ApplicationWindow

The UI is written in the QML (**Q**t Quick **M**arkup **L**anguage) language. It is written in a file which ends with the file extension .qml. But for a file to be considered a valid Qml file it should have at least one import statement and at least one object type.

There are primary types, `int`, `string`, `var` etc. And there are object types, `Rectangle`, `ApplicationWinow`, `RowLayout`, etc. The object types can contain the primary types. In that case the primary types are called attributes of the oject types.

Let us create our first window, which is created with the object type `ApplicationWindow`. It is found inside the `QtQuick.Controls.Basic` package. Lets run it with qmlview to see what we have now.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "My very first window"
}
```

You can see that we have in the code above we have import statements and at least one object type.

The `visible: true` code, if set to false, will make the Window invisible. It wouldn't be transparent it will just be a backgroud application.
