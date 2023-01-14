# ID

All object types can be called from a function or from another type using its id. There are two types of ids, pre-defined ids and custom ids. Pre-defined ids are `parent` and `children`. The `children` id is not always available, so its least used. So an object type can be accessed through its children or its parent.

A custom id can also be set using the `id` property. It must start with a lower case letter or underscore. All properties of an object type can be accessed using its `id`.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: rect01.someTitle

    Rectangle {

        property string someTitle: "Beautiful title"

        id: rect01
        width: parent.width
        height: 300
        color: "dodgerblue"
    }

}
```

You can see that we accessed the `width` property of the `ApplicationWindow` using the `parent` id because `ApplicationWindow` is the `parent` of `Rectangle`.

If you import a javascript file or a qml file, lets call that imported file and the file that imports it lets call it main file. The imported file has access to all the ids in the main file. But the main file doesn't have access to any id defined in the imported file. Therefore an id defined in a file that will be imported is only available within that file.
