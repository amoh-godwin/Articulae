# Build A Clone Of Windows' Photos App

In developing our app, there are two approaches we can take. 1) Top-Down approach where we and 2) bottom-up

We will be using the Top-down approach, because it is more real world like. Before you create a functionality for a button, the button should be there in the UI. In our case before you get an image to show, you should know where you want to show it and the window size you want to show it in, and so on. So it will be good to start with the UI first and then later connect the Python to it as a backend.

For our UI we will be using QML. The most popular and most loved desktop UI language in the world. Javascript-like styling language.

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

### Install Ninja-Preview

The last thing you will need to get is Ninja-Preview.

This is just a previewer of the UI files before we connect it to python, since we will be focusing on the UI before handling functionality with Python.

## Project Folder

Lets setup our project folders

Create a folder that will have all of your project files. You can call it whatever you want, eg: PhotosClone.

Inside this folder, create an empty file and name it `main.py`.

Create another folder in it, and call it `UI`, this will have specifically the UI files.

Nexxt, create an empty file and name it `main.qml` file inside the `UI` folder.

Finally, inside the `UI` folder and beside the `main.qml` file create another empty folder and call it `components`

We are done with the folders for now. Lets go on with the coding.

## The Front-end or Graphical User Interface

### Coding a Basic Window

Now open the main.qml file and add the basic window code in snipper 1.

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

*Snippet 1 - A Basic Window*

In Snippet 1, we have three import statements, notable among them is the `import QtQuick.Controls.Universal` code, which basically imports the controls (button, textfields, etc) all with the Universal styling. Then we have the `ApplicationWindow` Object type, which actually gives us our Window, all of the code we will be writing will be in this Object Type. It has an ID of `mainWindow` which allows us to access all properties of this type. The `visible: true` line is why we can see the Window, otherwise it will be running in the backround.

 **NB: Don't forget the visible code, unless you want to show a splash screen first before showing it.**

### Running our QML file

To run our QML file, we can either connect it to Python ( which is how it is done, in production) or we can test it using Ninja-Preview. Let us use Ninja-Preview.

To use Ninja-Preview:

1. Open Ninja-Preview

2. Drag and Drop the `main.qml` file into it

3. Click the green play button to run the file

![](D:\GitHub\Articulae\mds\images\ninja_preview_run.PNG)

You should see a basic window popup. As shown in below.

![](D:\GitHub\Articulae\mds\images\base_window.PNG)

Since we have already imported our universal styling which makes our controls look like that of the windows Universal style, we can set a dark theme for window.

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

*Snippet 2 - A Dark themed windows*

When you run it with Ninja-Preview, you should see that we now have a dark window

![](D:\GitHub\Articulae\mds\images\dark_window.PNG)

The photos app has multiple view, an individual view and a collections view, which is a sort of timeline of pictures view. But for the sake of brevity, which shall focus on only the individual viewer.

If you take a look at the Windows' Photos App, you can see that everything else draws on top of the image viewer. The buttons, the toolbar, just about everything is on top of the image its showing.

![](D:\GitHub\Articulae\mds\images\windows-photos-app.PNG)

We shall be implementing the same thing in this lesson.

Lets start by adding a stack view which we would have used even if we implemented the other views. This is to get you used to the `StackView`

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

*Snippet 3 - StackView*

In Snippet 3, we have added a stackview, it has been centered in on the parent, but that won't have any effect for now, since it is taking up all of the width and height of the parent.

The Stack stacks components one on top of the other and provide functions for switching between them. We will be using this even though we will be building just one view, just so if you would like to continue building the other views, the foundation will be there.

Lets create the component the component will show, the only for now. Create it in the `components` folder, lets call it a `IndividualView.qml`, if you want to name yours other than this, don't forget that the file must start with a capital letter, because we want to import it as a QML type in application.

Open the file and this code.

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

*Snippet 4 - We have added a Rectangle which fills its parent and its color has been set to `dodgerblue`*

Lets now use this newly created component in our `main.qml` file. First we have import the folder that the `IndividualView.qml` is in.

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

*Snippet 5 - We import the `components` folder as a relative path and then we namespace it using the `as` keyword and then specified a name (`Comp`) for the namespace. We later call our `IndividualView.qml` as a QML type by calling the namespace of the folder is in and then the filename without the dot (.) qml at  the end, this is why the filename needed to be started with a capital letter, so it can be imported as a `Type` we give it an `id` so we can use it anywhere, in this case we use it in the `StackView` as the initialItem.*

Now if you run it you will see a blue window.

![](D:\GitHub\Articulae\mds\images\blue_window.PNG)

Now our component has taken over the `StackView` which has also taken over our `ApplicationWindow`

**From hereon you will be seeing *three dots (...)* in the code, to represent code that has already been presented previously. E.g. the previous code could have been written as:**

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

*Snippet 6 - Pieces of the previous code has been replace with `...` to focus on newly added code. Compare the snippet 6 with the snippet 5 and see how easier it is to follow along. However at the end of the tutorial all of the codes will be posted.*

### Displaying Images

-----------------------

#### The case of Aspect Ration

Consider the Photo below

![](C:\Users\workgroup\Pictures\Saved%20Pictures\pexels-pixabay-358457.jpg)

Let us show this image in our application, 

----------------------------

Lets start displaying images in our application.

In the IndividualView coomponent, we will set the color now to `transparent` so we can see the dark background of our application. Then another `Rectangle`, the finally we add an `Image` type, we assign the property `source` to the filepath of the image we want to show.

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

*Snippet 7 - For the `source` property you can shoose to use either a relatinve path or a full path. If you are using a fullpath, prefix the path with `file:///` so QML can differenctiate between online `https://` from local files.*

When you run it, this is what you get.

![](D:\GitHub\Articulae\mds\images\no_aspect_ratio_waterfall.PNG) 

Notice how the image has been strecthed. This is because the width of the image is 1333px and the height is 2000, **the height is greater than the width**, so showing it in an application which has the **width greater than the height** will cause the width to strecth and the height to be skewed.

The width to height ratio of an image is known as **aspect ratio**. Applications use this information to decide how to show an image correctly so it doesn't get distorted on either side.

QML provides `sourceSize` which we can use to specify the actual size of the image file. It is also used to limit the amount of data that will actually be put into the ram to reduce ram usage. QML also provided aspect ratio property types, combined with the `sourceSize` we can show the image with the correct aspect ratio.

In our `IndividualView.qml` lets add the actual size as the `sourceSize` and then use `fillMode` to specify how we want the aspect ratio to be handled.

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

*Snippet 8 -*

Now run it.

You should see, something like this, depending on the image you used.

![](D:\GitHub\Articulae\mds\images\aspect_ratio_waterfall.PNG)

Please put in the corresponding dimensions for the image you choose to use as the `sourceSize`.

Now lets block our toolbar. Open IndividualView.qml and add a ToolBar

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

*Snippet 9 - The `ToolBar`'s background property has been modified, setting it to a Rectangle with a dark partially transparent color. All Controls have the `background` property but it is only modified when you don't like the default appearance*

When you run it, you should see

![](D:\GitHub\Articulae\mds\images\tool_bar_waterfall.PNG)

As we would like to improve it, lets make it a type, to keep things organized. Create a new file in the components folder and name it ControlBar.qml, in it put the ToolBar code we already have.

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

*Snippet 10 - You can see that we have added import statements. There must be import statement(s) that will be used in that file. All types are found within imports*

Now replace the `ToolBar` code with the newly created type in the `IndividualView.qml`

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

*Snippet 11 - You can see that we now have `ControlBar` where there used to be a lot of `ToolBar` code.*

When you run it, you should see the same thing you saw previously.

![](D:\GitHub\Articulae\mds\images\tool_bar_waterfall.PNG)

We shall improve on the toolbar later

For now lets add the navigation buttons

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

*Snippet 12 - We have a `RowLayout` which has been centered vertically inside its parent. In it we have two buttons.*

When you run this you should see

![](D:\GitHub\Articulae\mds\images\nav_buttons.PNG)

Next, lets also block the Zoom buttons.

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

*Snippet 13 -*

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

*Snippet 14 -*

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

*Snippet 15 -*

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

*Snippet 16 -*

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

*Snippet 17 -*

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

*Snippet 18 -*

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

*Snippet 19 -*

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

*Snippet 20 -*

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

*Snippet 21 -*

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

*Snippet 22 -*

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

*Snippet 23 -*

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

*Snippet 24 -*

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

*Snippet 25 -*

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

*Snippet 26 -*

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

*Snippet 27 -*

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

*Snippet 28 -*

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

*Snippet 29 -*

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

*Snippet 30 -*

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

*Snippet 31 -*

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

*Snippet 32 -*

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

*Snippet 33 -*

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

*Snippet 34 -*

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

*Snippet 35 -*

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

*Snippet 36 -*

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

*Snippet 37 -*

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

*Snippet 38 -*

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

*Snippet 39 -*

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

*Snippet 40 -*

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

*Snippet 41 -*

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

*Snippet 42 -*

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

*Snippet 43 -*

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

*Snippet 44 -*

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

*Snippet 45 -*

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

*Snippet 46 -*

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

*Snippet 47 -*

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

*Snippet 48 -*

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

*Snippet 49 -*

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

*Snippet 50 -*

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

*Snippet 51 -*

Now you should be able to click and view all images

![](D:\GitHub\Articulae\mds\images\nav_btns.PNG)

Finally we are all done. This has been a long tutorial so we will go no further.

|
