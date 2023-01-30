# Custom Types

### A qml file

A valid qml file, is a file that contains at least one import statement, either QtQml or QtQuick and at least one Object types.

So far we have seen qml files with two import statements (QtQuick, QtQuick.Controls.Basic) and one Object type as its root object (ApplicationWindow).

ApplicationWindow gives us a Window. Other do other things. Over 90% of the Object types that we use are themselves qml files, and they all contain another object type. In that case, we say they inherit another object type.

### Creating a custom type

A qml file that begins with a upper case alphabet will become an object type. And can be imported into another qml file as an object type, provided it obeys the rules of a valid qml file.

Lets create a file and call it MyOwnRectangle.qml. In it lets inherit a Rectangle

```qml
import QtQuick

Rectangle {
}

```

Lets import it a normal qml file, say main.qml.

To be able to import a qml file.

1. The qml file has to be in the same folder as the qml file that wants to import it

2. If it is in a folder, the folder can be imported with an import statement as: `import "./path/to/qmlfiles"`

3. The folder should be installed with a valid, qmldir file located inside the folder.



So now, lets put own MyOwnRectangle in the same folder as main.qml and import it as an object type in main.qml.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500

    MyOwnRectangle {
        anchors.centerIn: parent
        width: 200
        height: 200
        color: 'teal'
    }

}

```

### Building on top of an inherited type

Lets say we decide on building on top of `Rectangle`.

We add a new property diameter to it.

Lets us call this one MyRoundRect.qml.

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

We import and use the property like any other property.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500

    MyRoundRect {
        anchors.centerIn: parent
        diameter: 200
        color: 'teal'
    }

}

```

This method of customisation can be employed to organise long qml code into separate qml files and imported as object types to make the code more simpler and maintainable.
