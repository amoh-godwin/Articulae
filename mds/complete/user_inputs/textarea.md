# Text Area

A `TextArea` provides a multi-line editable text. It has all the properties of a TextInput but this one allows the user to entere a multi-line text data.

## Basic use

A `TextArea` is found in the `QtQuick.Controls.Basic` package. It has a `placeHolderText` property that will disappear once the user clicks to start editing the text in the `TextArea`.

```qml
import QtQuickimport QtQuick.Controls.BasicApplicationWindow {    visible: true    width: 800    height: 600    title: "Text Area"    TextArea {        placeholderText: "Enter text here..."    }}
```

Because it is for multi-line text editing you will most probably need scrolling function. Putting the `TextArea` into a `ScrollView`, the `ScrollView` will set the width and height of the `TextArea` and also handle the scrolling. You can see this from line 12 -18 of the playground below.

```qml
import QtQuick
import QtQuick.Controls.Basic


ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Text Area"


    ScrollView {
        anchors.fill: parent

        TextArea {
            placeholderText: "Enter text here..."
        }
    }

}

```

The `placeholderText` has a `placeholderTextColor` for modifying its color, if you will need it.

## Customization

`TextArea` has the font properties as a `Text` object would. It has a `color` property for specifying the color of the text that the user would be entering (see line 18 of the code below). Also there is a `background` property which can be used to modify the background of the `TextArea` to meet the styling needs of your application (see lines 20 - 21).

```qml
import QtQuick
import QtQuick.Controls.Basic


ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Text Area"


    ScrollView {
        anchors.fill: parent

        TextArea {
            color: "white"
            font.pixelSize: 14
            font.family: "Courier New"

            background: Rectangle {
                color: "#444444"
            }
        }
    }

}

```

The `text` property holds the actual text that has been entered by the user.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Text Area"

    SplitView {
        anchors.fill: parent

        ScrollView {
            SplitView.fillWidth: true
            SplitView.fillHeight: true

            TextArea {
                id: tArea
                color: "white"
                font.pixelSize: 14
                font.family: "Courier New"

                background: Rectangle {
                    color: tArea.hovered ? "#222222" : "#444444"
                }
            }
        }

        Rectangle {
            SplitView.preferredWidth: 400
            SplitView.fillHeight: true

            Text {
                anchors.fill: parent
                text: tArea.text
                textFormat: Text.MarkdownText
            }

        }

    }

}

```

## Modifying text

However, there is a `textFormat` property that can be used so that you can render HTML characters in the `TextArea`. This can useful for highlighting certain text entered by the user.

Lets see this in the code playground below

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Text Area"

    SplitView {
        anchors.fill: parent

        ScrollView {
            SplitView.fillWidth: true
            SplitView.fillHeight: true

            TextArea {
                id: tArea
                color: "white"
                font.pixelSize: 14
                font.family: "Courier New"
                textFormat: Text.RichText
                text: "<span style='text-decoration: underline; text-decoration-color: red;'>Helol</span> World!"

                background: Rectangle {
                    color: tArea.hovered ? "#222222" : "#444444"
                }
            }
        }

        Rectangle {
            SplitView.preferredWidth: 400
            SplitView.fillHeight: true

            Text {
                text: tArea.text
                anchors.fill: parent
                textFormat: Text.PlainText
            }



        }

    }

}

```

From the code above, we have set textFormat to Text.RichText in line 24, which enables the text input we have in line 25 to be rendered styled text, so the html characters will not get printed onto the screen. But the Text item from lines 37 to 41 has its textFormat set to Text.PlainText, so here you can see the html characters of the tArea being printed on to the screen. Since they are actually sharing the same text content.

The `textDocument` property can be used in Python together with `QSyntaxHighlighter` to handle syntax highlighting. The topic of syntax highlighting is beyond the scope of this course.
