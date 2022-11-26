# Build A Clone Of Windows' Photos App

Lets start

In developing our app, there are two approaches we can take. 1) Top-Down approach where we and 2) bottom-up

We will be using the Top-down approach, because it is more real world like. Before you create a functionality for a button, the button should be there in the UI. In our case before you get an image to show, you should know where you want to show it and the window size you want to show it in, and so on. So it will be good to start with the UI first and then later connect the Python to it as a backend.

For our UI we will be using QML. Javascript-like styling language.



## Installations

### Install PyQt6 or PySide6

There are two different types of Qt for Python. PyQt6 and PySide6. You can choose whichever one you want. i recommend PyQt6, because it makes installation easier. Whereas with PySide6, on occasions, you might have to tweak it to get it to work.

To install Open your Command Prompt or Terminal, and write the following.

```shell
$ pip install PyQt6
```

and if you prefer PySide6

```shell
$ pip install PySide6
```

The last thing you will need to get is Ninja-Preview.

This is just a previewer of the UI files before we connect it to python, since we will be focusing on the UI before handling functionality with Python.



## Project Folder

Lets setup our project folders

Create a folder that will have all of your project files. You can call it whatever you want, eg: PhotosClone.

Create a main.py file it it.

Create another folder in it, and call it 'UI', this will have specifically the UI files.

Create a main.qml file inside the UI folder.



Now open the main.qml file and add a basic window code

> main.qml

```qml
import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600

}
```

*Listing 1 -*

### Running our QML file

1. Open Ninja-Preview

2. Drag and Drop the `main.qml` file into it

3. Click the green play button to run the file

![](D:\GitHub\Articulae\mds\images\ninja_preview_run.PNG)

You should see a basic window popup

![](D:\GitHub\Articulae\mds\images\base_window.PNG)

Since we have already imported our s niversal styling which makes our controls look like that of the windows Universal style, we can set a dark theme



> main.qml

```qml
import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600

    Universal.theme: Universal.Dark

}
```

*Listing 1 -*

Now you should see

![](D:\GitHub\Articulae\mds\images\dark_window.PNG)

Now you can see that the only thing that doesn't look like a the windows photos app is the title bar, which we will remove later.

Now you can see that everything else draws on top of the image viewer.

The photos app allows multiple view type. For the sake of brevity, which shall focus on only the

So lets start by adding a stack view which we would have used even if we implemented the other view.

> main.qml

```qml
import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600

    Universal.theme: Universal.Dark

    StackView {
        id: mainStack
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }

}
```

*Listing 1 -*

Now you don't really see anythong

It chooses between components to display. Lets create a component that it can use.

Remember that the filename

> components/IndividualView.qml

```qml
import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts

Component {

    Rectangle {
        anchors.fill: parent
        color: "dodgerblue"
    }

}
```

*Listing 1 -*

Add it to the `main.qml` file

> main.qml

```qml
import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts
import "./components" as Comp


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600

    Universal.theme: Universal.Dark

    StackView {
        id: mainStack
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        initialItem: individual
    }

    Comp.IndividualView {id: individual}

}
```

*Listing 1 -*

The main changes were, we imported the folder that contains and namespaced it.

`import "./components" as Comp`, then we call the component ( components don't draw on default) and give it an id and then assigns it.

`initialItem: individual`

Now if you run it you would see aa blue window now.

![](D:\GitHub\Articulae\mds\images\blue_window.PNG)

From hereon you will be seeing three dots (...) in the code, to represent code that has already been presented previously. E.g. the previous code could have been written as:

> main.qml

```qml
import QtQuick
...
import "./components" as Comp


ApplicationWindow {
    ...
    height: 600

    Universal.theme: Universal.Dark

    StackView {
        id: mainStack
        ...
        initialItem: individual
    }

    Comp.IndividualView {id: individual}

}
```

Compare the above with the previous code, and see how easier it is to follow along.

 This is so we can focus on the newly added code better

For a picture like this

![](C:\Users\workgroup\Pictures\Saved%20Pictures\pexels-pixabay-358457.jpg)

In the IndividualView coomponent

> components/IndividualView.qml

```qml
import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts

Component {

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            id: viewerParent
            anchors.fill: parent
            color: "transparent"
            clip: true

            Image {
                id: viewer
                anchors.centerIn: parent
                width: parent.width
                height: parent.height
                source: "file:///C:/Users/workgroup/Pictures/Saved Pictures/pexels-pixabay-358457.jpg"
            }

        }

    }

}
```

If you are using a fullpath and not a relative epath. Prefix with 'file:///' so Qt can differenctiate between online 'https://' from local files.

When you run it this is what you get.

![](D:\GitHub\Articulae\mds\images\no_aspect_ratio_waterfall.PNG) 

Do not close it yet.

Then add a sourcesize and aspect ratio properties to the Image type

> components/IndividualView.qml

```qml
...

Component {

    Rectangle {
        ...

        Rectangle {
            id: viewerParent
            ...

            Image {
                id: viewer
                ...
                height: parent.height
                sourceSize.width: 1333
                sourceSize.height: 2000
                fillMode: Image.PreserveAspectFit
                source: "file:///C:/Users/workgroup/Pictures/Saved Pictures/pexels-pixabay-358457.jpg"
            }

        }

    }

}
```

Now click the run button in Ninja-Preview again to load a different Window.

You should see, something like this, depending on your image

![](D:\GitHub\Articulae\mds\images\aspect_ratio_waterfall.PNG)

The sourcewidth and sourceheight we have specified are the very dimensions of the image we have used, please put in the corresponding dimensions for the image you chose to use.

Now lets block our toolbar

> components/IndividualView.qml

```qml
...

Component {

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            id: viewerParent
            ...

            Image {
                ...
            }

        }

        ToolBar {
            id: toolbar
            width: parent.width
            height: 48

            background: Rectangle {
                color: "#90202020"
            }

        }

    }

}
```

When you run it, you should see

![](D:\GitHub\Articulae\mds\images\tool_bar_waterfall.PNG)

Create a new file name it ControlBar.qml

> components/ControlBar.qml

```qml
import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts


ToolBar {
    id: toolbar
    width: parent.width
    height: 48

    background: Rectangle {
        color: "#90202020"
    }

}
```

Now replace it in the `IndividualView.qml`

> components/IndividualView.qml

```qml
...

Component {

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            id: viewerParent
            ...

            Image {
                id: viewer
                ...
            }

        }

        ControlBar {
        }

    }

}
```

When you run it, you should see

![](D:\GitHub\Articulae\mds\images\tool_bar_waterfall.PNG)

We shall improve on the toolbar later

Lets add the navigation button

> components/IndividualView.qml

```qml
...

Component {

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            id: viewerParent
            ...

            Image {
                id: viewer
            }

        }

        ControlBar {
        }

        RowLayout {
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width
            height: 48

            Button {
                text: "<"
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 18
            }

            Button {
                text: ">"
                Layout.alignment: Qt.AlignRight
                Layout.preferredWidth: 18
            }

        }

    }

}
```

When you run this you should see

![](D:\GitHub\Articulae\mds\images\nav_buttons.PNG)

Next

addmik the zoom buttons

> components/IndividualView.qml

```qml
...

Component {

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            id: viewerParent
            ...

            Image {
                id: viewer
            }

        }

        ControlBar {
        }

        RowLayout {
            ...
        }

        RowLayout {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 12
            width: 132
            height: 30
            spacing: 0

            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "[]"
            }
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "-"
            }
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "+"
            }
        }

    }

}
```

When you run it, you should see

![](D:\GitHub\Articulae\mds\images\zoom_buttons.PNG)

Next improve on the toolbar.

You can see that the items are in a row. So we put in a rowlayout

> components/ControlBar.qml

```qml
...


ToolBar {
    id: toolbar
    width: parent.width
    height: 48


    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"

            ToolButton {
                id: ctrl
                text: "View all photos"
                width: 148
                height: 48
            }

        }

    }


    background: Rectangle {
        ...
    }

}
```

When you run it

![](D:\GitHub\Articulae\mds\images\toolbar_btn.PNG)

Lets add the menu at the end of the row..

> components/ControlBar.qml

```qml
...

ToolBar {
    id: toolbar
    ...


    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            ...

            ToolButton {
                ...
            }

        }

        MenuBar {
            Layout.preferredWidth: 46
            Layout.fillHeight: true

            Menu {
                title: "..."

                onAboutToShow: {
                    toolbar.height = 64
                }
                onAboutToHide: {
                    toolbar.height = 48
                }

                Action{
                    text: "Open with"
                }
                Action {
                    text: "Copy"
                }
                Action {
                    text: "Print"
                }
                Action {
                    text: "Set as"
                }
                MenuSeparator {}
                Action {
                    text: "File info"
                }
            }


        }

    }


    background: Rectangle {
        ...
    }

}
```

The `AboutToShow` increases the height.

![](D:\GitHub\Articulae\mds\images\toolbar_menubar.PNG)

Lets add the buttons found in between the two

Create a new file and name it CustToolButton.qml inside

> components/CustToolButton.qml

```qml
import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts


ToolButton {
    id: ctrl

    property string tip: ""

    Layout.fillHeight: true

    ToolTip {
        z: 10
        y: 0
        parent: parent
        visible: parent.hovered
        text: parent.tip
        delay: 1000
    }

}
```

Then import it inside

> components/ControlBar.qml

```qml
...


ToolBar {
    id: toolbar
    ...


    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            ...

            ToolButton {
                id: ctrl
                text: "View all photos"
                width: 148
                height: 48
            }

        }

        CustToolButton {
            text: "share"
            tip: "share"
        }

        MenuBar {
            ...
        }

    }




    background: Rectangle {
        ...
    }

}
```

When you run it you should see.

![](D:\GitHub\Articulae\mds\images\cust_btn_bar.PNG)

Now block the rest

> components/ControlBar.qml

```qml
...


ToolBar {
    id: toolbar
    ...


    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            ...

        }

        CustToolButton {
            text: "share"
            tip: "share"
        }

        CustToolButton {
            text: "slideshow"
            tip: "slideshow"
        }

        CustToolButton {
            text: "Edit"
            tip: "Edit"
        }
        CustToolButton {
            text: "Rotate"
            tip: "Rotate"
        }
        CustToolButton {
            text: "Delete"
            tip: "Delete"
        }

        MenuBar {
            ...
        }

    }




    background: Rectangle {
        ...
    }

}
```

![](D:\GitHub\Articulae\mds\images\tool_bar_allbtns.PNG)

Now lets improve on the custtoolbar

Now lets add the description at the button of the end

> components/CustToolButton.qml

```qml
...


ToolButton {
    id: ctrl

    property string description: ""
    property string tip: ""

    Layout.fillHeight: true

    contentItem: ColumnLayout {
        width: parent.wdith
        height: parent.height
        spacing: 0
        Text {
            topPadding: 8
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            text: ctrl.text
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            Layout.topMargin: -12
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: ctrl.description
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            visible: ctrl.height > 48
        }
    }

    ToolTip {
        ...
    }

}
```

Now the descript won't show if the height is less than 48 based on the code: `visible: ctrl.height > 48`

Now assign the descriptions

> components/ControlBar.qml

```qml
...


ToolBar {
    id: toolbar
    ...


    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            ...

        }

        CustToolButton {
            text: "share"
            description: "share"
            tip: "share"
        }

        CustToolButton {
            text: "slideshow"
            description: "slideshow"
            tip: "slideshow"
        }

        CustToolButton {
            text: "Edit"
            description: "Edit"
            tip: "Edit"
        }
        CustToolButton {
            text: "Rotate"
            description: "Rotate"
            tip: "Rotate"
        }
        CustToolButton {
            text: "Delete"
            description: "Delete"
            tip: "Delete"
        }

        MenuBar {
            ...
        }

    }

    ...

}
```

Almost all the buttons will have icons. Glphs.

Load the glyphs as icons

> main.qml

```qml
import QtQuick
...
import "./components" as Comp


ApplicationWindow {
    id: mainWindow
    ...

    Universal.theme: Universal.Dark

    FontLoader {id: segoe_mdl2; source: "./components/segoe-mdl2-assets.ttf" }

    StackView {
        ...
    }

    ...

}
```

We can access the glyphs from within our application once it has been loaded by the main entry file

Now use as the glyph for the CustToolButton

> components/CustToolButton.qml

```qml
...


ToolButton {
    id: ctrl
    ...

    contentItem: ColumnLayout {
        ...
        Text {
            ...
            text: ctrl.text
            font.family: segoe_mdl2.name
            font.pixelSize: 20
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            Layout.topMargin: -12
            ...
        }
    }

    ...

}
```

Glyphs uses unicode, so whatever we put as text will become an icon. Lets place these icons then

> components/ControlBar.qml

```qml
...


ToolBar {
    id: toolbar
    ...


    RowLayout {
        ...

        Rectangle {
            ...

        }

        CustToolButton {
            text: "\ue72d"
            description: "share"
            tip: "share"
        }

        CustToolButton {
            text: "\ue786"
            description: "slideshow"
            tip: "slideshow"
        }

        CustToolButton {
            text: "\ue70f"
            description: "Edit"
            tip: "Edit"
        }
        CustToolButton {
            text: "\ue7ad"
            description: "Rotate"
            tip: "Rotate"
        }
        CustToolButton {
            text: "\ue74d"
            description: "Delete"
            tip: "Delete"
        }

        MenuBar {
            ...
        }

    }




    background: Rectangle {
        ...
    }

}
```

When you run

![](D:\GitHub\Articulae\mds\images\glyph_toolbar.PNG)

Next lets add glyph for the menubar Icon

> components/ControlBar.qml

```qml
...


ToolBar {
    ...


    RowLayout {
        ...

        Rectangle {
            ...

        }

        ...

        MenuBar {
            font.pixelSize: 20
            font.family: segoe_mdl2.name
            Layout.preferredWidth: 46
            Layout.fillHeight: true

            Menu {
                ...
            }


        }

    }

    ...

}
```

Next we use the glyphs for the navigation icons. But lets create a specific compo for it so we can use it later on

Create a new file CustNavButton

> components/CustNavButton.qml

```qml
import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts

Button {
    text: ">"

    background: Rectangle {
        implicitHeight: 36
        color: parent.hovered ? Qt.rgba(255, 255, 255, 0.7): Qt.rgba(255, 255, 255, 0.5)
    }

    contentItem: Text {
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: parent.text
        font.family: segoe_mdl2.name
        font.pixelSize: 15
    }
}
```

You can see that we have used mdl2 icons for the text.

Next use it in the IndividualView component

> components/IndividualView.qml

```qml
...

Component {

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            ...
        }

        ControlBar {
        }

        RowLayout {
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width
            height: 48

            CustNavButton {
                text: "\uE76B"
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 18
            }

            CustNavButton {
                text: "\uE76C"
                Layout.alignment: Qt.AlignRight
                Layout.preferredWidth: 18
            }

        }

        RowLayout {
            ...
        }

    }

}
```

When you run it, you should see

![](D:\GitHub\Articulae\mds\images\nav_icons.PNG)

Next the button for the zoom controls

Lets create a new file and call it zoomButton.qml

> components/ZoomButon.qml

```qml
import QtQuick
import QtQuick.Controls.Universal

Button {
    background: Rectangle {
        implicitWidth: 24
        implicitHeight: 30
        color: parent.hovered ? Qt.rgba(255, 255, 255, 0.5) : Qt.rgba(0, 0, 0, 0.7)
    }

    contentItem: Text {
        text: parent.text
        font.family: segoe_mdl2.name
        font.pixelSize: 16
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: "white"
        renderType: Text.NativeRendering
    }

}
```

Now put it into IndividualView.qml

> components/IndividualView.qml

```qml
...

Component {

    Rectangle {
        ...

        Rectangle {
            id: viewerParent
            ...

        }

        ControlBar {
        }

        RowLayout {
            ...
        }

        RowLayout {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 12
            width: 132
            height: 30
            spacing: 0

            ZoomButton {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "\uEA4B"
            }
            ZoomButton {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "\uE949"
            }
            ZoomButton {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "\uE948"
            }
        }

    }

}
```

![](D:\GitHub\Articulae\mds\images\real_zoom_buttons.PNG)

Next lets do

| icon for view all photos

> components/ControlBar.qml

```qml
...


ToolBar {
    id: toolbar
    ...


    RowLayout {
        ...

        Rectangle {
            ...

            ToolButton {
                id: ctrl
                text: "View all photos"
                width: 148
                height: 48

                contentItem: RowLayout {
                    anchors.left:parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 12
                    anchors.rightMargin: 12

                    Text {
                        text: "\uEB9F"
                        font.family: segoe_mdl2.name
                        font.pixelSize: 16
                        color: "white"
                        renderType: Text.NativeRendering

                    }

                    Text {
                        text: ctrl.text
                        color: "white"
                        font.pixelSize: 16
                    }
                }

            }

        }

        CustToolButton {
            ...
        }

        CustToolButton {
            ...
        }

        CustToolButton {
            ...
        }
        CustToolButton {
            ...
        }
        CustToolButton {
            ...
        }

        MenuBar {
            ...
        }

    }




    background: Rectangle {
        ...
    }

}
```

![](D:\GitHub\Articulae\mds\images\view_all_photos_icon.PNG)

| Remove the title bar

> main.qml

```qml
...
import "./components" as Comp


ApplicationWindow {
    ...
    height: 600
    flags: Qt.FramelessWindowHint | Qt.Window

    Universal.theme: Universal.Dark

    FontLoader {id: segoe_mdl2; source: "./components/segoe-mdl2-assets.ttf" }

    StackView {
        ...
    }

    ...

}
```

You should see

![](D:\GitHub\Articulae\mds\images\frameless.PNG)

 You can close it by

![](D:\GitHub\Articulae\mds\images\frameless_close.PNG)

| Add a bar

> main.qml

```qml
...


ApplicationWindow {
    ...
    flags: Qt.FramelessWindowHint | Qt.Window

    Universal.theme: Universal.Dark

    FontLoader {id: segoe_mdl2; source: "./components/segoe-mdl2-assets.ttf" }

    header: Rectangle {
        width: parent.width
        height: 30
        color: "transparent"
    }

    StackView {
        ...
    }

    ...

}


```

[Image]

| Use a draggable

> main.qml

```qml
...


ApplicationWindow {
    id: mainWindow
    ...
    flags: Qt.FramelessWindowHint | Qt.Window

    property int orig_x: 0
    property int orig_y: 0

    Universal.theme: Universal.Dark

    FontLoader {id: segoe_mdl2; source: "./components/segoe-mdl2-assets.ttf" }

    header: Rectangle {
        width: parent.width
        height: 30
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onPressed: {
                orig_x = mouseX
                orig_y = mouseY
            }

            onPositionChanged: {
                if(!containsPress) {
                    return;
                }
                var dx = mouse.x - orig_x
                var dy = mouse.y - orig_y
                var newx = mainWindow.x + dx
                var newy = mainWindow.y + dy
                mainWindow.setX(newx);
                mainWindow.setY(newy);
            }

            onReleased: {
                orig_x = mouseX
                orig_y = mouseY
            }

        }

    }

    StackView {
        ...
    }

    ...

}


```

![](D:\GitHub\Articulae\mds\images\movable.PNG)

| Add the close buttons

Create a new file  name it CloseButton.qml

> components/CloseButton.qml

```qml
import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts

Button {

    background: Rectangle {
        implicitWidth: 46
        implicitHeight: 28
        color: parent.hovered ? Qt.rgba(255, 255, 255, 0.1): "transparent"
    }

    contentItem: Text {
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: parent.text
        font.family: segoe_icon.name
        font.pixelSize: 10
        color: "white"
    }
}

```

Now use it in the main.qml

> main.qml

```qml
...


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    flags: Qt.FramelessWindowHint | Qt.Window

    property int orig_x: 0
    property int orig_y: 0

    Universal.theme: Universal.Dark

    FontLoader {id: segoe_mdl2; source: "./components/segoe-mdl2-assets.ttf" }

    header: Rectangle {
        width: parent.width
        height: 30
        color: "transparent"

        MouseArea {
            ...
        }

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 12
            spacing: 0

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "transparent"
            }

            Comp.CloseButton {
                text: "\ue921"
                onClicked: mainWindow.showMinimized()
            }

            Comp.CloseButton {
                text: "\ue922"
                onClicked: mainWindow.showMaximized()
            }

            Comp.CloseButton {
                text: "\ue8bb"
                onClicked: mainWindow.close()
            }

        }

    }

    StackView {
        ...
    }

    ...

}


```

above

![](D:\GitHub\Articulae\mds\images\closebuttons.PNG)

| Use title for title

We will be using titles now

> main.qml

```qml
...


ApplicationWindow {
    ...
    flags: Qt.FramelessWindowHint | Qt.Window

    property string title_str: "Photos"

    property int orig_x: 0
    property int orig_y: 0

    ...

    header: Rectangle {
        ...

        MouseArea {
            ...
        }

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 12
            spacing: 0

            Text {
                text: title_str
                font.pixelSize: 12
                font.bold: true
                color: "white"
            }

            Rectangle {
                ...
            }

            Comp.CloseButton {
                ...
            }

            ...

        }

    }

    StackView {
        ...
    }

    ...

}


```

ll

![](D:\GitHub\Articulae\mds\images\title_str.PNG)

Add portrait code to control maximise and minimise

> main.qml

```qml
...


ApplicationWindow {
    ...

    property string title_str: "Photos"
    property bool portrait: width < 803

    property int orig_x: 0
    ...    

    header: Rectangle {
        ...

        MouseArea {
            ...

        }

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 12
            spacing: 0

            Text {
                ...
            }

            Rectangle {
                ...
            }

            Comp.CloseButton {
                text: "\ue921"
                onClicked: mainWindow.showMinimized()
            }

            Comp.CloseButton {
                text: portrait ? "\ue922" : "\uE923"
                onClicked: portrait ? mainWindow.showMaximized() : mainWindow.showNormal()
            }

            Comp.CloseButton {
                text: "\ue8bb"
                onClicked: mainWindow.close()
            }

        }

    }

    StackView {
        ...
    }

    ...

}


```

Add a border

```qml
...


ApplicationWindow {
    ...

    property string title_str: "Photos"
    property bool portrait: width < 803

    ...

    header: Rectangle {
        width: parent.width - 2
        height: 30
        color: "transparent"

        MouseArea {
            ...

        }

        RowLayout {
            ...
        }

    }

    StackView {
        id: mainStack
        anchors.centerIn: parent
        width: parent.width - 2
        height: parent.height -2
        initialItem: individual
    }

    Comp.IndividualView {id: individual}

    background: Rectangle {
        width: parent.width
        height: parent.height
        border.width: portrait ? 1 : 0
        border.color: "gold"
        color: "transparent"
    }

}


```

| all UI done

Create backed

| Connect the python

Inside the main.py link the qml file.

> main.py

```python
import sys

from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine
from PyQt6.QtQuick import QQuickWindow


QQuickWindow.setSceneGraphBackend('software')

app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
engine.load('./UI/main.qml')
engine.quit.connect(app.quit)

sys.exit(app.exec())

```

Now run it using command prompt or the terminal

Navigate to the exact folder, as shown in image

```shell
>>> python main.py
```

![](D:\GitHub\Articulae\mds\images\Cmd.PNG)



Now the functionality will be kept in a separate file so code can be well organised.

Create a new file, name it func.py

> func.py

```python
from PyQt6.QtCore import QObject


class Backend(QObject):

    def __init__(self, parent=None):
        QObject.__init__(self)

```

Connect it to the main.py

> main.py

```python
...
from PyQt6.QtQuick import QQuickWindow

from func import Backend


QQuickWindow.setSceneGraphBackend('software')
...

engine = QQmlApplicationEngine()
back_end = Backend()
engine.load('./UI/main.qml')
engine.rootObjects()[0].setProperty('backend', back_end)
engine.quit.connect(app.quit)

...


```

Connect it with the qml code.

```qml
...


ApplicationWindow {
    ...
    property int orig_y: 0

    property QtObject backend

    Universal.theme: Universal.Dark

    FontLoader {id: segoe_mdl2; source: "./components/segoe-mdl2-assets.ttf" }

    header: Rectangle {
        ...

    }

    StackView {
        ...
    }

    ...

    background: Rectangle {
        
    }

    Connections {
        target: backend
    }

}


```

Now create  startup method

> func.py

import statements

```python
import os
import threading
from typing import List, Tuple
from PIL import Image
from PyQt6.QtCore import QObject


class Backend(QObject):

    def __init__(self, parent=None):
        QObject.__init__(self)


```

Then in the file, in the class `Backend`

> func.py

```python
...


class Backend(QObject):

    def __init__(self, parent=None):
        QObject.__init__(self)
        self.image_extensions = ('.jpg', '.png', '.jpeg', '.gif', '.tiff', '.svg')
        self.images_sizes = tuple()
        self.curr_folder = ""
        self.curr_folder_imgs = tuple()
        self.curr_index = 0

    def get_image_sizes(self):
        sizes_thread = threading.Thread(target=self._get_image_sizes)
        sizes_thread.daemon = True
        sizes_thread.start()

    def _get_image_sizes(self):
        sizes = []
        for img in self.curr_folder_imgs:
            sizes.append(self.get_size(img))

        self.images_sizes = tuple(sizes)

    def get_size(self, img_name: str) -> Tuple:

        img = Image.open(img_name)
        w, h = img.size

        return w, h

    def start_up(self, argv: List):
        if len(argv) > 1:
            self.curr_folder = os.path.abspath(os.path.dirname(argv[1]))
            conts = os.listdir(self.curr_folder)

            imgs = []
            index = -1
            for item in conts:
                ext = os.path.splitext(item)[-1]
                if ext in self.image_extensions:
                    index += 1
                    fullpath = os.path.abspath(os.path.join(self.curr_folder,
                    item))
                    if fullpath == argv[1]:
                        self.curr_index = index

                    imgs.append(fullpath)

            self.curr_folder_imgs = tuple(imgs)

            self.get_image_sizes()

            w, h = self.get_size(argv[1])
            total = len(self.curr_folder_imgs)
            img_name = os.path.abspath(argv[1])
            title = os.path.split(img_name)[-1]
            name = "file:///" + img_name
            if '//' in img_name:
                name = img_name

            print(title, name, self.curr_index, w, h, total)



```

Call the startup method

> main.py

```python
...
back_end = Backend()
engine.load('./UI/main.qml')
engine.rootObjects()[0].setProperty('backend', back_end)
back_end.start_up(sys.argv)
engine.quit.connect(app.quit)

sys.exit(app.exec())


```

Usin the command prompt or ter

![](D:\GitHub\Articulae\mds\images\Cmd_filepath.PNG)

After running, among the warnings,

![](D:\GitHub\Articulae\mds\images\print.PNG)

Make the connections for them in Qml

Usings signals

> func.py

```python
...
from PIL import Image
from PyQt6.QtCore import QObject, pyqtSignal as Signal


class Backend(QObject):

    def __init__(self, parent=None):
        ...
        self.curr_index = 0

    firstImage = Signal(str, str, int , int, int, int)

    def get_image_sizes(self):
        ...

    ...

    def start_up(self, argv: List):
        if len(argv) > 1:
            ...

            if '//' in img_name:
                name = img_name

            self.firstImage.emit(title, name, self.curr_index, w, h, total)



```

> main.qml

```qml
...


ApplicationWindow {
    ...

    property QtObject backend

    property string currImageSource: ""
    property int currIndex: -1
    property int imgWidth
    property int imgHeight
    property int imgTotal

    Universal.theme: Universal.Dark

    FontLoader {id: segoe_mdl2; source: "./components/segoe-mdl2-assets.ttf" }

    header: Rectangle {
        ...

    }

    StackView {
        ...
    }

    Comp.IndividualView {id: individual}

    background: Rectangle {
        ...
    }

    Connections {
        target: backend

        function onFirstImage(title, img, index, w, h, total) {
            title_str = title + " - Photos"
            currImageSource = img
            currIndex = index
            imgWidth = w
            imgHeight = h
            imgTotal = total
        }

    }

}


```

> components/IndividualView.qml

```qml
...

Component {

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            ...

            Image {
                id: viewer
                anchors.centerIn: parent
                width: parent.width
                height: parent.height
                sourceSize.width: imgWidth
                sourceSize.height: imgHeight
                fillMode: Image.PreserveAspectFit
                source: currImageSource
            }

        }

        ControlBar {
        }

        RowLayout {
            ...
        }

        RowLayout {
            ...
        }

    }

}


```

New image

![](D:\GitHub\Articulae\mds\images\new_image.PNG)

The nav buttons

> components/IndividualView.qml

```qml
...

Component {

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            id: viewerParent
            ...
        }

        ControlBar {
        }

        RowLayout {
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width
            height: 48

            CustNavButton {
                text: "\uE76B"
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 18
                onClicked: backend.get_image_at_index(currIndex - 1)
                visible: currIndex > 0
            }

            CustNavButton {
                text: "\uE76C"
                Layout.alignment: Qt.AlignRight
                Layout.preferredWidth: 18
                onClicked: backend.get_image_at_index(currIndex + 1)
                visible: currIndex < imgTotal - 1
            }

        }

        RowLayout {
            ...
        }

    }

}


```

create the get imae at index slot.

> func.py

the import statements

```python
import os
import threading
from typing import List, Tuple
from PIL import Image
from PyQt6.QtCore import QObject, pyqtSignal as Signal, pyqtSlot as Slot


class Backend(QObject):

    def __init__(self, parent=None):
        QObject.__init__(self)
        ...

```

Now the `Backend` class

> func.py

```python
...

class Backend(QObject):

    def __init__(self, parent=None):
        ...
        self.curr_index = 0

    firstImage = Signal(str, str, int , int, int, int)
    updateImage = Signal(str, str, int, int, int)

    @Slot(int)
    def get_image_at_index(self, index: int):
        g_thread = threading.Thread(
            target=self._get_image_at_index,
            args=[index])
        g_thread.daemon = True
        g_thread.start()

    def _get_image_at_index(self, index: int):

        if self.curr_folder_imgs[index]:
            self.curr_index = index
            img_name = self.curr_folder_imgs[index]
            curr_img = "file:///" + img_name
            if '//' in img_name:
                curr_img = img_name
            title = os.path.split(curr_img)[-1]
            w, h = self.images_sizes[index]
            self.updateImage.emit(title, curr_img, self.curr_index, w, h)

    def get_image_sizes(self):
        ...

    ...


```

Receive this signal too in Qml

> main.qml

```qml
...


ApplicationWindow {
    ...

    header: Rectangle {
        ...
    }

    StackView {
        ...
    }

    Comp.IndividualView {id: individual}

    background: Rectangle {
        ...
    }

    Connections {
        target: backend

        function onFirstImage(title, img, index, w, h, total) {
            title_str = title + " - Photos"
            currImageSource = img
            currIndex = index
            imgWidth = w
            imgHeight = h
            imgTotal = total
        }

        function onUpdateImage(title, img, index, w, h) {
            title_str = title + " - Photos"
            currImageSource = img
            currIndex = index
            imgWidth = w
            imgHeight = h
        }

    }

}


```

Now you should be able to click and view all images



![](D:\GitHub\Articulae\mds\images\nav_btns.PNG)

Finally we are all done. This has been a long tutorial so we will go no further.

|
