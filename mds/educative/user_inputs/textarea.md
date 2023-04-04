# Text Area

[text]

## Basic use

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic


ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Text Area"


    TextArea {
        placeholderText: "Enter text here..."
    }

}

```

[text]

Putting it in a scrollview, the scrollview will set its width and height and also handle the scroll.

`code.txt`

The `placeholderText` has a `placeholderTextColor` for modifying its color. But you can ignore it completly.


## customization

It has all the font properties of a Text. It has a color property. The background property is used to modify the property.

`code1.txt`



The text property holds the actual text

`code2.txt`

[text]



The textFormat property can be used so that the actual text you send to it will be html formatted text.

`code3.txt`

The textDocument property can be used in python together with QSyntaxHighlighter to handling syntax highlighting. That is beyond the scope of this course.
