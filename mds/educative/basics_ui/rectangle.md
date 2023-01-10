# Rectangle

The next UI element on the popularity chart is the `Rectangle`. It is found in the `QtQuick` package.

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
        border.color: "gold"
        border.width: 3
        radius: 5
    }


}
```

The color code for the `Rectangle` has a transparency of 77%, indicated by the `77` in front of the other 6 numbers. We could have also set the color to `"transparent"`
