# Text

The `Text` object type provides the text. It is found within the `QtQuick` import.

The actual text gets set to the `text` property.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        text: "Hello World!"
        font.family: "Freestyle Script"
        font.pixelSize: 32
        color: "indigo"
        anchors.centerIn: parent
    }

}

```


