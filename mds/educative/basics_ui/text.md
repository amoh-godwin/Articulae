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
        anchors.centerIn: parent
        text: "Hello World!"
    }

}
```

### font.pixelSize

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        anchors.centerIn: parent
        text: "Hello World!"
        font.pixelSize: 32
    }

}
```

### font.bold

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        anchors.centerIn: parent
        text: "Hello World!"
        font.pixelSize: 16
        font.bold: true
    }

}
```

### font.family

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        anchors.centerIn: parent
        text: "Hello World!"
        font.pixelSize: 16
        font.family: "Courier New"
    }

}
```

You can use an uninstalled font either from an online source or from a local source. First you have to load the font using `FontLoader` give it an `id` and use its `name` attribute as the `font.family`

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    FontLoader {id: robo_font; source: "./Roboto-Regular.ttf"}

    Text {
        text: "Hello World!"
        font.family: robo_font.name
        font.pixelSize: 32
        anchors.centerIn: parent
    }

}
```

### renderType

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        anchors.centerIn: parent
        text: "Hello World!"
        font.pixelSize: 64
        renderType: Text.QtRendering
    }

}
```

### elide

#### elideRight

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        width: parent.width
        text: "The Quick Brown Fox Jumps Over The Lazy Dog"
        font.pixelSize: 32
        elide: Text.ElideRight
    }

}
```

#### elideLeft

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        width: parent.width
        text: "The Quick Brown Fox Jumps Over The Lazy Dog"
        font.pixelSize: 32
        elide: Text.ElideLeft
    }

}
```

#### elideMiddle

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        width: parent.width
        text: "The Quick Brown Fox Jumps Over The Lazy Dog"
        font.pixelSize: 32
        elide: Text.ElideMiddle
    }

}
```

### wrapMode

#### WordWrap

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        width: parent.width
        text: "The Quick Brown Fox Jumps Over The Lazy Dog. And again, " +
              "A Living Dog Is Better Than A Dead Lion"
        font.pixelSize: 32
        wrapMode: Text.WordWrap
    }

}
```

#### WrapAnywhere

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        width: parent.width
        text: "The Quick Brown Fox Jumps Over The Lazy Dog. And again, " +
              "A Living Dog Is Better Than A Dead Lion"
        font.pixelSize: 32
        wrapMode: Text.WrapAnywhere
    }

}
```

#### Wrap

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        width: parent.width
        text: "The Quick Brown Fox Jumps Over The Lazy Dog. And again, " +
              "A Living Dog Is Better Than A Dead Lion"
        font.pixelSize: 32
        wrapMode: Text.Wrap
    }

}
```

#### NoWrap

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        width: parent.width
        text: "The Quick Brown Fox Jumps Over The Lazy Dog. And again, " +
              "A Living Dog Is Better Than A Dead Lion"
        font.pixelSize: 32
        wrapMode: Text.NoWrap
    }

}
```

### textFormat

#### RichText

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        width: parent.width
        text: "<b>Hello</b> <span style='color: green'>World!</span>"
        font.pixelSize: 32
        textFormat: Text.RichText
    }

}
```

#### StyledText

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        width: parent.width
        text: "<b>Hello</b> <i>World!<i>"
        font.pixelSize: 32
        textFormat: Text.StyledText
    }

}
```

#### MarkdownText

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        width: parent.width
        text: "**Hello** *World!*"
        font.pixelSize: 32
        textFormat: Text.MarkdownText
    }

}
```

#### PlainText

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "Text"

    Text {
        width: parent.width
        text: "<b>Hello</b> <i>World!</i>"
        font.pixelSize: 32
        textFormat: Text.PlainText
    }

}
```
