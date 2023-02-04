# ApplicationWindow

There are two main approaches to software engineering in general. A Top-Down approach and a Bottom-Up approach. 

## Top-Down Approach

A top-down approach is when we start with the UI design, design the buttons and the input fields, before we add the functionality. That is we have our button that says download,  and a progress bar, before we write the code that makes the API call to download a youtube video

## Bottom-Up Approach

And Bottom-UP approach is just the opposite. We start writing code to download videos from YouTube, before we design a UI that interfaces with the code.

If you are embarking on a personal project or an experiment, a bottom-up approach is what you will most likely go for, I should warn that a bottom-up approach is much faster. Since the UI design, if not designed as a whole, but as a progressive project, will be subsitible to trend influence and color changes. On the other hand, team project will  most likely have guidelines, and experienced programmers, so it will be faster to have the UI ready, before writing the functionality specified by the UI.

## This Course's Approach

In this course, we will be using the Top-Down approach, the same approach used by teams. We will focus on writing the UI first before moving on to connect it to python and then write functionality code needed by the UI.

Functionality code or backend code is known as business logic in Desktop Application Programming.

The UI code will be written in QML (**Q**t Quick **M**arkup **L**anguage), the most popular UI code for Desktop applications. It is written in a file which ends with the file extension .qml. It is pretty straightforward and easy to learn.

## A valid Qml file

But for a file to be considered a valid Qml file it should have at least one import statement and at least one object type.

## Window

For UI scripting, the most basic and the most important thing is getting a window to show. It is quit an easy code in Qml, it is done using an ApplicationWindow.

ApplicationWindow has background, contentItem, header, menubar and footer properties. These properties are set to other Object types we will be seeing later on. The background item will become the background of the entire ApplicationWindow. But a menubar will be drawn on top of a header as in the illustration below.

The contentItem property doesn't have to be set uprightly. All visual items placed inside an ApplicationWindow will automatically be set to the contentItem, so you don't have to set it explicitedly.

There are primary types, `int`, `string`, `var` etc. And there are object types, `Rectangle`, `ApplicationWinow`, `RowLayout`, etc. The object types can contain the primary types. In that case the primary types are called attributes of the oject types.

## Basic Window

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

## Visibility Matters

The `visible: true` code, if set to false, will make the Window invisible. It wouldn't be transparent, it will just be a backgroud application.

You can use the, `x`, `y` properties to control the positioning of the window.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    y: 100
    x: 0
    width: 500
    height: 500
    title: "My very first window"
}
```

## Background color

`color` to set the background color.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "My very first window"
    color: "black"
}
```

## The Screen Object

If you want to fill the entire dimension of the window. There is a Screen object type you can use.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: Screen.width
    height: Screen.height
    title: "My very first window"
}
```

This approach will fill up the entire window including the window taskbar and system menu.

To fill the entire width leaving out the window taskbar and system menu use Screen.desktopAvailableWidth and Screen.desktopAvailableHeight instead.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    x: 0
    y: 0
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    title: "My very first window"
}
```

There are also methods for setting the properties. SetX, SetY, setWidth, setHeight, setTitle.

## Signal Handler

There are also signals, that can be handled using Javascript syntax. But such signal handlers must strictly be prefixed with on followed by the title case of the signal's name. For instance, there is a default signal for all components called completed. So the signal handlers name will be onCompleted. Lets use that to change the title of our window.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 500
    title: "My very first window"

    Component.onCompleted: {
        this.setTitle("New Title")
        this.setY(100)
        this.setX(100)
        this.setHeight(100)
    }
}
```

Signal handlers are emitted after a property has been changed.
