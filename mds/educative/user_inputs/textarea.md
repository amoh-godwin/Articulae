# Text Area

A `TextArea` provides a multi-line editable text.

## Basic use[](https://www.educative.io/pageeditor/6586453712175104/6144552105934848/6371466972233728#Basic-use)

A `TextArea` is found in the `QtQuick.Controls.Basic` package. It has a `placeHolderText` property that will disappear once the user clicks to start editing the text in the `TextArea`

```qml
import QtQuickimport QtQuick.Controls.BasicApplicationWindow {    visible: true    width: 800    height: 600    title: "Text Area"    TextArea {        placeholderText: "Enter text here..."    }}
```

Because it is for multi-line text editing you will most probably need scrolling function. Putting the `TextArea` into a `ScrollView`, the `ScrollView` will set the width and height of the `TextArea` and also handle the scrolling. You can see this from the playground below.

`code.txt`

The `placeholderText` has a `placeholderTextColor` for modifying its color, if you will need it.

## Customization[](https://www.educative.io/pageeditor/6586453712175104/6144552105934848/6371466972233728#Customization)

`TextArea` has the font properties as a `Text` object would. It has a `color` property for specifying the color of the text that the user would be entering. Also there is a `background` property which can be used to modify the background of the `TextArea` to meet the styling needs of your application.

`code1.txt`

The `text` property holds the actual text that has been entered by the user.

`code2.txt`

## Modifying text[](https://www.educative.io/pageeditor/6586453712175104/6144552105934848/6371466972233728#Modifying-text)

However, there is a `textFormat` property that can be used so that you can render HTML characters in the `TextArea`. This can useful for highlighting certain text entered by the user.

Lets see this in the code playground below

`code3.txt`

The `textDocument` property can be used in python together with `QSyntaxHighlighter` to handle syntax highlighting. The topic of syntax highlighting is beyond the scope of this course.
