# Flags

[text]

## Frameless flags

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Flags 1"
    color: "gold"
    flags: Qt.SplashScreen
}

```

If we had used `Qt.FramelessWindowHint` instead of `Qt.SplashScreen`, we will be able to mix it with other flags to get an icon drawn on the taskbar.

Mix it with other flags

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Flags 1"
    color: "gold"
    flags: Qt.FramelessWindowHint | Qt.Window
}

```

[text]
