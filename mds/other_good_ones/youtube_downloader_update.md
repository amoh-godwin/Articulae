## Create a YouTube Downloader in Python

![](https://github.com/DanielITech/yt-downloader/raw/main/images/final.PNG)

Recently, popular web extensions that enable faster downloads of YouTube videos are becoming increasingly difficult to install. As a student of Software Development, there are so many lessons we can learn from even a simple desktop application like a YouTube downloader. So let's dive into it.

## Things we will learn from this tutorial

Layouts

Nested Layouts

Custom Buttons and Text inputs

Using ListViews

Using ScrollViews

Multiple Qml files

**and from Python,**

DataClasses

Nested functions

Using the PyTube library

So you can see all the above-mentioned concepts will be used in this lesson.

First off, the installations

## Installation

Install PyQt

Install Pytube

This tutorial assumes that you already have Python installed and an IDE like VSCode available.

### Install PyQt

To install PyQt, open your command Prompt or the Terminal in MacOS

Then do:

on Windows

```plaintext
>>> pip install PyQt6
```

on Mac or Linux

```plaintext
$ pip3 install PyQt6
```

### Install PyTube

on Windows

```plaintext
>>> pip install pytube
```

on Mac or Linux

```plaintext
$ pip3 install pytube
```

## Designing the UI

In designing UI's, we can choose to do a Top-Down approach or a Bottom-Up approach. Lets do a top down approach. Which means we will be starting with the UI and after we are done, move to the backend or the application logic.

#### Create Folders

Let's create the folders within which we will be working.

Create a folder somewhere on your computer and name it `yt-downloader`

and inside it create a file and name it `main.py` create another folder next to the `main.py` and name it `UI`. Inside the `UI` folder create a file and name it `main.qml`. Beside this file, create another folder and title it as `customs`

So we should have a directory structure similar to something like

```plaintext
yt-downloader
  -- UI
    - main.qml
    -- customs
  - main.py
```

In following this tutorial, we will create a lot of files, not because the task requires them, but so our application is neatly organised and more readable and so it's easier to post the code here for you to follow along, and so most of the code will be compartmentalised into files.

Now open the Python file `main.py` code and populate it with this code.

> main.py

```python
import sys

from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine
from PyQt6.QtQuick import QQuickWindow


QQuickWindow.setSceneGraphBackend("software")

app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
engine.load('./UI/main.qml')
engine.quit.connect(app.quit)

sys.exit(app.exec())
```

In the above code, we have imported the `sys` module, we will need it to get arguments that are passed to the application when its called, and also to properly exit out of our application so there is no error that the application didn't exit properly.

Next we import `QGuiApplication` which will be the app itself, then we import `QQmlApplicationEngine` which enables us to pass a QML file to the application.

We also import `QQuickWindow`, but this is just compatibility code, it enables the application to run on low spec computers, then the code `QQuickWindow.setSceneGraphBackend("software")` is what makes that possible. Read more about it [here](https://doc.qt.io/qt-6/qtquick-visualcanvas-adaptations.html)

Then we create the app by calling the `QGuiApplication` class, where we pass the arguments from the `sys` into it.

_**NB. We are yet to run the app.**_

The lines that follow initialise the `QmlApplicationEngine` and load the QML file. Here, it is the 'main.qml' file located in the 'UI' folder, so the relative file path is: './UI/main.qml'.

The `engine.quit.connect` code makes sure that when the UI has been closed that the host application is also closed.

Then, finally inside the `sys.exit` funtion you can see that there is an `app.exec()` this is the method that actually runs ( executes) our application which we've created. It returns an exit code when the app closes, we pass that into the `sys.exit` function.

Before we can get the application to run, we need to have something in our 'main.qml' file. So let's go on ahead and populate it with Qml code.

Open the main.qml code and then populate it with this code for now.

> main.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: "Downloader"
}
```

In the above code, we have our import statements and then we have `ApplicationWindow` with a `width` and `height` specified and a `title` that says "Downloader". This will successfully show you a window when you run the file.

#### Running the file

We can now run the python file to see the entire app with the UI that we have as at now.

Open your Command Prompt or Terminal on Unix machines. For instance, if your yt-downloader folder is located at `path/to/yt-downloader`

Navigate into your project folder as:

```plaintext
~$ cd path/to/yt-downloader
```

then run the `main.py` as

```plaintext
$ python main.py
```

Now you should see a blank window, with a title similar to this.

![](https://github.com/DanielITech/yt-downloader/raw/main/images/blank.PNG)

Now let's continue

We will add a QML property as a placeholder for our backend object, which we are yet to create, cos all we have done now is to connect QML with a python. There is no direct object for QML to speak with python. That object will be connected to the QML property we are going to create now. But for now, it will only be a placeholder, waiting to be connected in the future.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: "Downloader"

    property QtObject downloader

}
```

#### Add a Header

Let us add a header since our application will be frameless eventually. A header keeps the code clean and well organized. The header will hold the URL field and search button.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: "Downloader"

    property QtObject downloader

    header: Rectangle {
        width: parent.width
        height: 78
        color: "transparent"

        ColumnLayout {
            anchors.fill: parent

            Rectangle {
                Layout.fillWidth: true
                height: 18
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 60

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 24
                    height: 1
                    color: "darkgrey"
                    anchors.bottom: parent.bottom
                }

            }
        }

    }

}
```

The above code attaches a `Rectangle` as the `header` of the `ApplicationWindow`. This way, we separate this top part, so to speak, in a way from the rest of the application.

Within the `Rectangle` there is a `columnLayout` that arranges the two `Rectangle`s within it into a column.

The `Rectangle` with a height of `18` will hold close buttons, and the one with `60` will hold the URL field. The rectangle with a height of `1`pixel acts as a bottom border.

If you run it, you should see something similar to this.

![](https://github.com/DanielITech/yt-downloader/raw/main/images/header.PNG)

Next, import the `customs` folder as a namespace, so custom QML object types will not conflict with QML base object types. Soon we will have a few of our custom QML object types in the customs folder.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "./customs" as Cust

ApplicationWindow {
    id: mainWindow
    visible: true

...
```

The first custom QML object type we will be creating is the `CloseButton`, it will inherit from `Button`.

Create a file named `CloseButton.qml` in the customs folder. The capitalization is so important, it enables the file to be imported into another QML file.

```plaintext
yt-downloader
  -- UI
    -- customs
      - CloseButton.qml
```

Then populate it with this code.

> CloseButton.qml

```qml
import QtQuick
import QtQuick.Controls.Basic

Button {
    id: btn
    width: 10
    height: 10

    property color bg_color: "darkgrey"

    background: Rectangle {
        radius: 5
        color: btn.bg_color
    }

}
```

The above code, uses a `Button` (inherits it), adds a new property `bg_color` to its properties and sets it to `darkgrey` and then customises the background, setting its color to whatever color the `bg_color` may hold.

We will now use `CloseButton.qml` in our main.qml file.

> main.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "./customs" as Cust

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: "Downloader"

    property QtObject downloader

    header: Rectangle {
        width: parent.width
        height: 78
        color: "transparent"

        ColumnLayout {
            anchors.fill: parent

            Rectangle {
                Layout.fillWidth: true
                height: 18

                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 4

                    Cust.CloseButton {
                        onClicked: {
                            mainWindow.showMinimized()
                        }
                    }

                    Cust.CloseButton {
                        bg_color: "dimgrey"

                        onClicked: {
                            mainWindow.close()
                        }

                    }

                }

            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 60

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 24
                    height: 1
                    color: "darkgrey"
                    anchors.bottom: parent.bottom
                }

            }
        }

    }

}
```

In the above code, we have a `Row` anchored to the right of its parent, and then we have two `CloseButton`s accessed using the `Cust` namespace since they are inside the `customs` folder, it was imported as namespace `Cust`. You can see that the `clicked` signal of these buttons has been handled using the `onClicked` signal handler. And one of the buttons has changed the `bg_color` property to `dimgrey`.

If you run it, you should see the two buttons at the top right corner of the application.

Clicking them will cause two different effects. Try them, and read the code to see why.

![](https://github.com/DanielITech/yt-downloader/raw/main/images/close_btn.PNG)

Let's add our URLfield and the search button.

> main.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "./customs" as Cust

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: "Downloader"

    property QtObject downloader

    header: Rectangle {
        width: parent.width
        height: 78
        color: "transparent"

        ColumnLayout {
            anchors.fill: parent

            Rectangle {
                Layout.fillWidth: true
                height: 18

                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 4

                    Cust.CloseButton {
                        onClicked: {
                            mainWindow.showMinimized()
                        }
                    }

                    Cust.CloseButton {
                        bg_color: "dimgrey"

                        onClicked: {
                            mainWindow.close()
                        }

                    }

                }

            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 60

                RowLayout {
                    anchors.centerIn: parent
                    height: 36
                    spacing: 12

                    TextField {
                        id: url_field
                        placeholderText: "https://"

                        background: Rectangle {
                            implicitWidth: 380
                            implicitHeight: 30
                            radius: 15
                            border.color: "darkgrey"
                        }
                    }

                    Button {
                        text: "Search"

                        background: Rectangle {
                            implicitWidth: 80
                            height: 30
                            radius: 15
                            border.color: "darkgrey"
                            color: parent.down ? "dimgrey" : "white"
                        }

                        contentItem: Text {
                            text: parent.text
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            color: parent.down ? "white" : "dimgrey"
                        }

                        onClicked: downloader.search_video(url_field.text)
                    }

                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 24
                    height: 1
                    color: "darkgrey"
                    anchors.bottom: parent.bottom
                }

            }
        }

    }

}
```

In the above code, we've customized the background of a TextField and then given it a placeholder. Then we have also customized a button and customized its background to change color when the button has been pressed down, also the contentItem has been customised so the Text will change color when the button has been pressed down.

Run it, and you should see the URL field and the search button.

![](https://github.com/DanielITech/yt-downloader/raw/main/images/sear.PNG)

#### Make Header Draggable

Since our window will eventually become frameless, we have to handle the draggability of the UI ourselves. Let us make the header draggable.

> main.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "./customs" as Cust

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: "Downloader"

    property QtObject downloader
    property int old_x
    property int old_y
    property bool press: false

    header: Rectangle {
        width: parent.width
        height: 78
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onPressed: {
                old_x = mouse.x
                old_y = mouse.y
                press = true
            }

            onReleased: {
                press = false
            }

            onPositionChanged: {
                let new_x = mouse.x - old_x
                let new_y = mouse.y - old_y
                if(press) {
                    mainWindow.x = mainWindow.x + new_x
                    mainWindow.y = mainWindow.y + new_y
                }
            }
        }

        ColumnLayout {
            anchors.fill: parent

            Rectangle {
                Layout.fillWidth: true
                height: 18

                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 4

                    Cust.CloseButton {
                        onClicked: {
                            mainWindow.showMinimized()
                        }
                    }

                    Cust.CloseButton {
                        bg_color: "dimgrey"

                        onClicked: {
                            mainWindow.close()
                        }

                    }

                }

            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 60

                RowLayout {
                    anchors.centerIn: parent
                    height: 36
                    spacing: 12

                    TextField {
                        id: url_field
                        placeholderText: "https://"

                        background: Rectangle {
                            implicitWidth: 380
                            implicitHeight: 30
                            radius: 15
                            border.color: "darkgrey"
                        }
                    }

                    Button {
                        text: "Search"

                        background: Rectangle {
                            implicitWidth: 80
                            height: 30
                            radius: 15
                            border.color: "darkgrey"
                            color: parent.down ? "dimgrey" : "white"
                        }

                        contentItem: Text {
                            text: parent.text
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            color: parent.down ? "white" : "dimgrey"
                        }

                        onClicked: downloader.search_video(url_field.text)
                    }

                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 24
                    height: 1
                    color: "darkgrey"
                    anchors.bottom: parent.bottom
                }

            }
        }

    }

}
```

In the above code, we have added 3 properties to the `ApplicationWindow`. Most importantly, we have added a `MouseArea` to the `header` Item. When any mouse button is pressed within the `MouseArea`, it will save the current x and y positions and when the mouse is moved, we calculate to get how many more or less pixels the mouse has moved from its old position and move the window accordingly. 

Now holding down and dragging the header, you can see the header is draggable.

#### Scrollview and Listview

Now let's add the most important element of our application, the `Listview`. Let's put it inside a `Scrollview`. It's always good to put a `Listview` into a `Scrollview`.

> main.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "./customs" as Cust

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: "Downloader"

    property QtObject downloader
    property int old_x
    property int old_y
    property bool press: false

    header: Rectangle {
        width: parent.width
        height: 78
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onPressed: {
                old_x = mouse.x
                old_y = mouse.y
                press = true
            }

            onReleased: {
                press = false
            }

            onPositionChanged: {
                let new_x = mouse.x - old_x
                let new_y = mouse.y - old_y
                if(press) {
                    mainWindow.x = mainWindow.x + new_x
                    mainWindow.y = mainWindow.y + new_y
                }
            }
        }

        ColumnLayout {
            anchors.fill: parent

            Rectangle {
                Layout.fillWidth: true
                height: 18

                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 4

                    Cust.CloseButton {
                        onClicked: {
                            mainWindow.showMinimized()
                        }
                    }

                    Cust.CloseButton {
                        bg_color: "dimgrey"

                        onClicked: {
                            mainWindow.close()
                        }

                    }

                }

            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 60

                RowLayout {
                    anchors.centerIn: parent
                    height: 36
                    spacing: 12

                    TextField {
                        id: url_field
                        placeholderText: "https://"

                        background: Rectangle {
                            implicitWidth: 380
                            implicitHeight: 30
                            radius: 15
                            border.color: "darkgrey"
                        }
                    }

                    Button {
                        text: "Search"

                        background: Rectangle {
                            implicitWidth: 80
                            height: 30
                            radius: 15
                            border.color: "darkgrey"
                            color: parent.down ? "dimgrey" : "white"
                        }

                        contentItem: Text {
                            text: parent.text
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            color: parent.down ? "white" : "dimgrey"
                        }

                        onClicked: downloader.search_video(url_field.text)
                    }

                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 24
                    height: 1
                    color: "darkgrey"
                    anchors.bottom: parent.bottom
                }

            }
        }

    }

    Rectangle {
        anchors.fill: parent

        ScrollView {
            anchors.fill: parent
            anchors.margins: 12
            anchors.topMargin: 18
            clip: true

            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

            ListView {
                id: lv
                anchors.fill: parent
                width: parent.width
                height: parent.height
                model:  3
                spacing: 12
                delegate: Cust.VideoDelegate {}
            }

        }

    }

}
```

In the above code, we've put a `Rectangle` beside the `header` and directly inside the `ApplicationWindow`, Object types placed this way become the `contentItem` of the `ApplicationWindow.` Inside this `Rectangle`, we place the `Scrollview` and the `Listview`.

The Scrollview's `clip` has been set to `true` to prevent the items from overflowing the Scrollview. The listview, for now, is using the integer `3` as its `model`. The `delegate` repeats according to the length of the model. In this case, it simply means that the `delegate` will repeat three times in the view. The `delegate` is a `VideoDelegate` object type in the `customs` folder that we are yet to create, so let's create it. (NB: We could have called it any other name, such as Video\_dele\_ga\_te.qml. Provided it started with a capital letter)

#### Create the Video Delegate

Go into your `customs` folder and create a file named `VideoDelegate.qml`.

```plaintext
yt-downloader
  -- UI
    -- customs
      -- VideoDelegate.qml
```

Inside VideoDelegate.qml, place this code

> VideoDelegate.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "." as Cust

Component {
    Rectangle {
        width: ListView.view.width
        height: 126
        RowLayout {
            anchors.fill: parent
            spacing: 12

            Rectangle {
                width: 224
                Layout.fillHeight: true
                color: "dimgrey"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "gold"
            }

            Rectangle {
                width: 148
                Layout.fillHeight: true
                color: "pink"

            }

        }

    }
}
```

In the above code, we have a dot(.) import, which is the folder itself, we need it to access other Object types declared inside the 'customs' folder besides the 'VideoDelegate.qml'. Also, we have a `RowLayout`, in it, there are three `Rectangle`s with three different colors.

When you run it, you should see something like this.

![](https://github.com/DanielITech/yt-downloader/raw/main/images/model.PNG)

#### Add image and title text

In the first `Rectangle`, we put in an `Image`, for now, the `source` will be bunny.jpg. You can use any image on your computer and place it directly inside the `UI` folder. And, in the second `Rectangle`, we will put in a `Text`.

> VideoDelegate.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "." as Cust

Component {
    Rectangle {
        width: ListView.view.width
        height: 126
        RowLayout {
            anchors.fill: parent
            spacing: 12

            Rectangle {
                width: 224
                Layout.fillHeight: true
                color: "dimgrey"

                Image {
                    anchors.fill: parent
                    source: "../bunny.jpg"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    text: "Big Buck Bunny 60fps 4K - Official Blender Foundation Short Film"
                    font.pixelSize: 16
                    wrapMode: Text.Wrap
                    height: parent.height
                    width: parent.width
                    color: Qt.rgba(0,0,0,0.7)
                }
            }

            Rectangle {
                width: 148
                Layout.fillHeight: true
                color: "pink"

            }

        }

    }
}
```

When you run it, you should see something similar to this.

![](https://github.com/DanielITech/yt-downloader/raw/main/images/bunny.PNG)

#### Add the combo and button

Let us add a ComboBox and DownloadButton into the final Rectangle of the VideoDelegate and then go ahead to create them.

> VideoDelegate.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "." as Cust

Component {
    Rectangle {
        width: ListView.view.width
        height: 126
        RowLayout {
            anchors.fill: parent
            spacing: 12

            Rectangle {
                width: 224
                Layout.fillHeight: true
                color: "dimgrey"

                Image {
                    anchors.fill: parent
                    source: "../bunny.jpg"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    text: "Big Buck Bunny 60fps 4K - Official Blender Foundation Short Film"
                    font.pixelSize: 16
                    wrapMode: Text.Wrap
                    height: parent.height
                    width: parent.width
                    color: Qt.rgba(0,0,0,0.7)
                }
            }

            Rectangle {
                width: 148
                Layout.fillHeight: true

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 2

                    Cust.ComboBox {
                        Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                        model: ['720p', '1080p']
                    }

                    Cust.DownloadButton {
                        Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
                        text: "Download"
                    }

                }

            }

        }

    }
}
```

The above code places a `ComboBox` and a `DownloadButton` in a `ColumnLayout`. The color of the Rectangle has been removed. Now let's create these two files.

#### Create the ComboBox file

In the 'customs' folder, create a new file and name it ComboBox.qml.

```plaintext
yt-downloader
  -- UI
    -- customs
      - VideoDelegate.qml
      - ComboBox.qml
```

Open the ComboBox.qml file and populate it with this code.

> ComboBox.qml

```qml
import QtQuick
import QtQuick.Controls.Basic

ComboBox {

    background: Rectangle {
        implicitWidth: 56
        implicitHeight: 24
        radius: 2
        border.color: "darkgrey"
    }

    contentItem: Text {
        text: parent.displayText
        color: "darkgrey"
        rightPadding: 8
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    indicator: Rectangle {
        x: 46
        y: 10
        width: 4
        height: width
        radius: width / 2
        color: "darkgrey"
    }
}
```

In the above code, we are customizing a `ComboBox`, it's `indicator` particularly has been turned into a darkgrey circle. Its not adding on any new properties.

#### Create DownloadButton file

Beside ComboBox.qml create DownloadButton.qml file.

```plaintext
yt-downloader
  -- UI
    -- customs
      - ComboBox.qml
      - DownloadButton.qml
```

Open the DownloadButton.qml file and populate it with this code.

> DownloadButton.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Button {

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 24
        color: parent.down ? Qt.darker("#0078d4") : "#0078d4"
        radius: height / 2
    }

    contentItem: Text {
        text: parent.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: "white"
    }
}
```

In the above code, we customize the button, we make the background color darker than the blue it is when its pressed down.

When you run, you should see something similar to this.

![](https://github.com/DanielITech/yt-downloader/raw/main/images/all.PNG)

For now, all 3 rows show the same image and text. That is because the model doesn't contain any attributes apart from the default index, which, by the way, every model type has, and the delegate doesn't even check for model attributes. So, next, we will use a `ListModel` as the model instead of just `3`

#### Use ListModel

Let us use a ListModel, which supports all complexities and all simplicities according to our needs.

> main.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "./customs" as Cust

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: "Downloader"

    property QtObject downloader
    property int old_x
    property int old_y
    property bool press: false

    header: Rectangle {
        width: parent.width
        height: 78
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onPressed: {
                old_x = mouse.x
                old_y = mouse.y
                press = true
            }

            onReleased: {
                press = false
            }

            onPositionChanged: {
                let new_x = mouse.x - old_x
                let new_y = mouse.y - old_y
                if(press) {
                    mainWindow.x = mainWindow.x + new_x
                    mainWindow.y = mainWindow.y + new_y
                }
            }
        }

        ColumnLayout {
            anchors.fill: parent

            Rectangle {
                Layout.fillWidth: true
                height: 18

                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 4

                    Cust.CloseButton {
                        onClicked: {
                            mainWindow.showMinimized()
                        }
                    }

                    Cust.CloseButton {
                        bg_color: "dimgrey"

                        onClicked: {
                            mainWindow.close()
                        }

                    }

                }

            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 60

                RowLayout {
                    anchors.centerIn: parent
                    height: 36
                    spacing: 12

                    TextField {
                        id: url_field
                        placeholderText: "https://"

                        background: Rectangle {
                            implicitWidth: 380
                            implicitHeight: 30
                            radius: 15
                            border.color: "darkgrey"
                        }
                    }

                    Button {
                        text: "Search"

                        background: Rectangle {
                            implicitWidth: 80
                            height: 30
                            radius: 15
                            border.color: "darkgrey"
                            color: parent.down ? "dimgrey" : "white"
                        }

                        contentItem: Text {
                            text: parent.text
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            color: parent.down ? "white" : "dimgrey"
                        }

                        onClicked: downloader.search_video(url_field.text)
                    }

                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 24
                    height: 1
                    color: "darkgrey"
                    anchors.bottom: parent.bottom
                }

            }
        }

    }

    Rectangle {
        anchors.fill: parent

        ScrollView {
            anchors.fill: parent
            anchors.margins: 12
            anchors.topMargin: 18
            clip: true

            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

            ListView {
                id: lv
                anchors.fill: parent
                width: parent.width
                height: parent.height
                model:  ListModel {}
                spacing: 12
                delegate: Cust.VideoDelegate {}

                Component.onCompleted: {
                    lv.model.append({
                        'title': 'Sprite Fun',
                        'thumbnail': '../sprite.jpg',
                        'link': '',
                        'percent': 49,
                        'file_path': ""
                    })
                }
            }

        }

    }

}

```

In the above code snippet, we change the model from `3` to an empty `ListModel` however, it can update its attributes dynamically. So you can see, that we also have `Component.onCompleted` signal handler that appends more data to the model of the Listview (`lv`).

Run the code, and you see just one row now, which is something similar to this.

![](file://C:%5CUsers%5Cworkgroup%5CPictures%5Cdata_model.PNG?msec=1662624867397)

The reason we have just one row is that the length of the model is now 1. A `ListModel` consists of `ListElement`s, and each has attributes, like:

```plaintext
ListModel {
    ListElement {
       title: ""
       age: ""
       size: ""
    }
}
```

So what we appended to the `lv` `model` becomes one `ListElement` with `'title', 'thumbnail', 'link', 'percent', 'file_path'` as the attributes. These attributes are efficiently accessible within the VideoDelegate since there will be a unique delegate for each row or ListElement.

So let's use these attributes in our `VideoDelegate`

> VideoDelegate.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "." as Cust

Component {
    Rectangle {
        width: ListView.view.width
        height: 126
        RowLayout {
            anchors.fill: parent
            spacing: 12

            Rectangle {
                width: 224
                Layout.fillHeight: true
                color: "dimgrey"

                Image {
                    anchors.fill: parent
                    source: thumbnail
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    text: title
                    font.pixelSize: 16
                    wrapMode: Text.Wrap
                    height: parent.height
                    width: parent.width
                    color: Qt.rgba(0,0,0,0.7)
                }
            }

            Rectangle {
                width: 148
                Layout.fillHeight: true

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 2

                    Cust.ComboBox {
                        Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                        model: ['720p', '1080p']
                    }

                    Cust.DownloadButton {
                        Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
                        text: file_path ? 'Open File' : "Download"

                        onClicked:{
                            if (this.text == 'Download') {
                                percent = 0.002; downloader.download(index, link)
                            } else {
                                percent = 0
                                downloader.open_file(index, file_path)
                            }
                        }
                    }

                }

            }

        }

    }
}
```

In the above code, the `thumbnail` , `title`, have been used as `Image` `source` and `Text`, `text` respectively, and the `DownloadButton`'s text changes based on the `file_path`, also we are changing the value of the `percent` which initially was set to `49` when we appended to the model. Notice the lack of use of quotes. Moreover, every model, whether a simple model as `3` or a data model as ListModel, they all provide one attribute we can always count on, which is the `index`, and you can see that that too has been used to tell the backend which model we are working on, since the application can take multiple downloads at the same time.

**NB:** _Please make sure the image you use as the thumbnail for appending to the model of the_ `_lv_` _is an image that exists on your computer and that you are using the correct full path or relative path to it. Since we are in the customs folder, we back out with '..' in the relative path '../sprite.jpg'_

When you run you will see that the delegate is using data specified in the model.

![](https://github.com/DanielITech/yt-downloader/raw/main/images/sprite.PNG)

#### Progress Bar Overlay

Let's add a progress bar. Let's make it overlaid on top of each row or `Delegate`.

> VideoDelegate.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "." as Cust

Component {
    Rectangle {
        width: ListView.view.width
        height: 126
        RowLayout {
            anchors.fill: parent
            spacing: 12

            Rectangle {
                width: 224
                Layout.fillHeight: true
                color: "dimgrey"

                Image {
                    anchors.fill: parent
                    source: thumbnail
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Text {
                    text: title
                    font.pixelSize: 16
                    wrapMode: Text.Wrap
                    height: parent.height
                    width: parent.width
                    color: Qt.rgba(0,0,0,0.7)
                }
            }

            Rectangle {
                width: 148
                Layout.fillHeight: true

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 2

                    Cust.ComboBox {
                        Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
                        model: ['720p', '1080p']
                    }

                    Cust.DownloadButton {
                        Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
                        text: file_path ? 'Open File' : "Download"

                        onClicked:{
                            if (this.text == 'Download') {
                                percent = 0.002; downloader.download(index, link)
                            } else {
                                percent = 0
                                downloader.open_file(index, file_path)
                            }
                        }
                    }

                }

            }

        }

        Rectangle {
            anchors.fill: parent
            color: "#44ffffff"
            visible: percent > 0.001

            Rectangle {
                anchors.centerIn: parent
                width: parent.width - 100
                height: 12
                radius: 6
                color: "#24000000"

                Rectangle {
                    width: parent.width / 100 * percent
                    height: parent.height
                    radius: parent.radius
                    color: "#0078d4"
                    opacity: 0.8
                }

                Text {
                    anchors.centerIn: parent
                    text: percent + "%"
                    color: percent > 50 ? "white" : "dimgrey"
                }
            }
        }

    }
}
```

In the above code, we have added another `Rectangle` right next to the `RowLayout`. Since they will both not be in any layout, but in a `Rectangle`, the latter will overlay on the former. So the last `Rectangle` will draw on top of the first `Rectangle`. But then, the last `Rectangle` will only be visible if the `percent` is greater than `0.001`.

#### Make the windows frameless

Add window flags to the application to make it frameless.

> main.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "./customs" as Cust


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: "Downloader"

    flags: Qt.FramelessWindowHint | Qt.Window

    property QtObject downloader
    property int old_x
    property int old_y
    property bool press: false

...
```

When you run, you should see that the “Title bar” is gone.

![](https://github.com/DanielITech/yt-downloader/raw/main/images/frameless_prog.PNG)

#### Add a border around the window

> main.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "./customs" as Cust


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: "Downloader"

    flags: Qt.FramelessWindowHint | Qt.Window

    property QtObject downloader
    property int old_x
    property int old_y
    property bool press: false

    header: Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            margins: 1
        }
        width: parent.width
        height: 78
        color: "transparent"


        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onPressed: {
                old_x = mouse.x
                old_y = mouse.y
                press = true
            }

            onReleased: {
                press = false
            }

            onPositionChanged: {
                let new_x = mouse.x - old_x
                let new_y = mouse.y - old_y
                if(press) {
                    mainWindow.x = mainWindow.x + new_x
                    mainWindow.y = mainWindow.y + new_y
                }
            }
        }
        
        ColumnLayout {
            anchors.fill: parent

            Rectangle {
                Layout.fillWidth: true
                height: 18

                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 4

                    Cust.CloseButton {
                        onClicked: {
                            mainWindow.showMinimized()
                        }
                    }

                    Cust.CloseButton {
                        bg_color: "dimgrey"

                        onClicked: {
                            mainWindow.close()
                        }

                    }

                }

            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 60

                RowLayout {
                    anchors.centerIn: parent
                    height: 36
                    spacing: 12

                    TextField {
                        id: url_field
                        placeholderText: "https://"

                        background: Rectangle {
                            implicitWidth: 380
                            implicitHeight: 30
                            radius: 15
                            border.color: "darkgrey"
                        }
                    }

                    Button {
                        text: "Search"

                        background: Rectangle {
                            implicitWidth: 80
                            height: 30
                            radius: 15
                            border.color: "darkgrey"
                            color: parent.down ? "dimgrey" : "white"
                        }

                        contentItem: Text {
                            text: parent.text
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            color: parent.down ? "white" : "dimgrey"
                        }

                        onClicked: downloader.search_video(url_field.text)
                    }

                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 24
                    height: 1
                    color: "darkgrey"
                    anchors.bottom: parent.bottom
                }

            }
        }

        Rectangle {
            width: parent.width
            height: 1
            anchors.top: parent.top
            color: "#44000000"
        }


    }

    Rectangle {
        anchors.fill: parent
        anchors.margins: 1

        ScrollView {
            anchors.fill: parent
            anchors.margins: 12
            anchors.topMargin: 18
            clip: true

            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

            ListView {
                id: lv
                anchors.fill: parent
                width: parent.width
                height: parent.height
                model:  ListModel {}
                spacing: 12
                delegate: Cust.VideoDelegate {}

                Component.onCompleted: {
                    lv.model.append({
                        'title': 'Sprite Fun',
                        'thumbnail': '../sprite.jpg',
                        'link': '',
                        'percent': 49,
                        'file_path': ""
                    })
                }
            }

        }

    }

    background: Rectangle {
        color: "#44000000"

        Rectangle {
            anchors.fill: parent
            anchors.margins: 1
        }

    }

}
```

In the above code, we've customized the `background` of the `ApplicationWindow`. We have created an inner `Rectangle` also in it. The outer one will have a dark background to create the illusion of a border. We have also given the `header` `margins` and put another `Rectangle` after the `ColumnLayout`to put a bar on top of the `header`, to create the same illusion. Since these are separate entities.

![](https://github.com/DanielITech/yt-downloader/raw/main/images/border_progress.PNG)

**!!!We are done with the UI**

## Connect to the Backend

Let's now connect our UI to some Application Logic or Backend code

#### Create downloader.py

Create a file beside the main.py and name it `downloader.py` from there we will control our UI. We could have done it directly inside `main.py` but this is the recommended way.

```plaintext
yt-downloader
  - main.py
  - downloader.py
  -- UI
```

Let us have our imports

> downloader.py

```python
import os
import threading
from dataclasses import dataclass, asdict

from PyQt6.QtCore import QObject, pyqtSlot as Slot, pyqtSignal as Signal
from pytube import YouTube
```

#### Dataclass

We will be using a Dataclass because a dataclass will make things simpler than a dictionary.

Let us create a dataclass named Info as seen below

> downloader.py

```python
import os 
from platform import system
import threading
from dataclasses import dataclass, asdict

from PyQt6.QtCore import QObject, pyqtSlot as Slot, pyqtSignal as Signal
from pytube import YouTube


@dataclass
class Info:
    link: str
    title: str
    thumbnail: str
    percent: int = 0
    file_path: str = ""
```

Since the Dataclass will be turned into a dictionary before being sent to the QML layer, the names of the attributes in the dataclass should match those we are expecting in our UI.

#### Downloader Class

Now, let's create our actual `Downloader` class. It will be a subclass of `QObject`

> downloader.py

```python
import os
from platform import system
import threading
from dataclasses import dataclass, asdict

from PyQt6.QtCore import QObject, pyqtSlot as Slot, pyqtSignal as Signal
from pytube import YouTube


@dataclass
class Info:
    link: str
    title: str
    thumbnail: str
    percent: int = 0
    file_path: str = ""


class Downloader(QObject):

    def __init__(self, parent=None):
        super().__init__()
        os_name = system().lower()
        env_name = 'HOME'
        if os_name == 'windows':
            env_name = 'USERPROFILE'
        self.output_path = os.path.join(os.environ[env_name], 'yt-downloader')
        if not os.path.exists(self.output_path):
            os.makedirs(self.output_path)
            if os_name != 'windows':
                os.system(f'chmod +rw {self.output_path}')

    progressChanged = Signal(int, int, arguments=['progressChanged'])
    returnVideoInfo = Signal(list, arguments=['videoInfo'])
    downloaded = Signal(int, str, arguments=['downloaded'])

    def _download(self, ind, link):
        yt = YouTube(
            link,
            on_progress_callback=self.progress_wrapper(ind),
            on_complete_callback=self.downloaded_wrapper(ind)
            )

        streams = yt.streams.filter(file_extension='mp4')
        video = yt.streams.get_by_resolution('720p')
        video.download(output_path=self.output_path)

    def _open_file(self, ind, fp):
        os.system(f'explorer {fp}')

    def _search_video(self, link):
        vid = YouTube(link)
        info = Info(link, vid.title, vid.thumbnail_url)
        model = asdict(info)
        print(model)
        self.returnVideoInfo.emit([model])

    def progress_wrapper(self, index):

        def progress_changed(vid, chunk, remaing_bytes):
            total = vid.filesize - remaing_bytes
            percent = int(total / vid.filesize * 100)
            self.progressChanged.emit(index, percent)

        func = progress_changed
        return func

    def downloaded_wrapper(self, index):
        def download_complete(value, filepath):
            self.downloaded.emit(index, filepath)

        return download_complete

    @Slot(int, str)
    def download(self, ind, link):
        d_thread = threading.Thread(target=self._download, args=[ind, link])
        d_thread.daemon = True
        d_thread.start()

    @Slot(int, str)
    def open_file(self, ind, file_path):
        d_thread = threading.Thread(target=self._open_file, args=[ind, file_path])
        d_thread.daemon = True
        d_thread.start()

    @Slot(str)
    def search_video(self, link):
        s_thread = threading.Thread(target=self._search_video, args=[link])
        s_thread.daemon = True
        s_thread.start()
```

In the above code, we have several methods for the `Downloader` class. The `__init__` method creates a folder named 'yt-downloader' in the platform-dependent user's folder and sets it to `self.output_folder` variable.

There are three `Slot`s, `download`, `open_file`, and `search_video`. Slots are methods that can be called from QML. These slot methods don't do the work themselves. If they did, the UI would freeze. So it starts a thread and calls other methods to do the work and returns results to QML by emitting `Signal`s. There are three `Signal`s `progressChanged`, `returnVideoInfo`, and `downloaded`. And then there are two nested methods, which take the index and return a callback method that has access to a specified index passed from QML through the `download` slot and meant for QML.

#### Connect Downloader class to UI

To make use of our `Downloader` class, we should import and connect it.

Import the `Downloader` class from the `downloader` module.

> main.py

```python
import sys

from PyQt6.QtQuick import QQuickWindow
from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine

from downloader import Downloader


QQuickWindow.setSceneGraphBackend("software")

app = QGuiApplication(sys.argv)

down = Downloader()

engine = QQmlApplicationEngine()
engine.load('./UI/main.qml')
engine.rootObjects()[0].setProperty('downloader', down)
engine.quit.connect(app.quit)

sys.exit(app.exec())
```

In the above code, we create an object `down` out of the `Downloader` class and then set it to the QML property `downloader` which we have already declared in `main.qml`

#### Make the connections in Qml

To call python methods from QML we use Slots, to call QML from python we use Signals. We have already connected our Downloader class to the QML downloader property, now we can call python from QML and vice-versa. But for Signals to be handled, they need their signal handlers specifically inside a `Connections` object targeted on that property.

> main.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "./customs" as Cust

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: "Downloader"

    flags: Qt.FramelessWindowHint | Qt.Window

    property QtObject downloader
    property int old_x
    property int old_y
    property bool press: false

    header: Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            margins: 1
        }
        width: parent.width
        height: 78
        color: "transparent"


        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onPressed: {
                old_x = mouse.x
                old_y = mouse.y
                press = true
            }

            onReleased: {
                press = false
            }

            onPositionChanged: {
                let new_x = mouse.x - old_x
                let new_y = mouse.y - old_y
                if(press) {
                    mainWindow.x = mainWindow.x + new_x
                    mainWindow.y = mainWindow.y + new_y
                }
            }
        }

        ColumnLayout {
            anchors.fill: parent

            Rectangle {
                Layout.fillWidth: true
                height: 18

                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 4

                    Cust.CloseButton {
                        onClicked: {
                            mainWindow.showMinimized()
                        }
                    }

                    Cust.CloseButton {
                        bg_color: "dimgrey"

                        onClicked: {
                            mainWindow.close()
                        }

                    }

                }

            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 60

                RowLayout {
                    anchors.centerIn: parent
                    height: 36
                    spacing: 12

                    TextField {
                        id: url_field
                        placeholderText: "https://"

                        background: Rectangle {
                            implicitWidth: 380
                            implicitHeight: 30
                            radius: 15
                            border.color: "darkgrey"
                        }
                    }

                    Button {
                        text: "Search"

                        background: Rectangle {
                            implicitWidth: 80
                            height: 30
                            radius: 15
                            border.color: "darkgrey"
                            color: parent.down ? "dimgrey" : "white"
                        }

                        contentItem: Text {
                            text: parent.text
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            color: parent.down ? "white" : "dimgrey"
                        }

                        onClicked: downloader.search_video(url_field.text)
                    }

                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 24
                    height: 1
                    color: "darkgrey"
                    anchors.bottom: parent.bottom
                }

            }
        }

        Rectangle {
            width: parent.width
            height: 1
            anchors.top: parent.top
            color: "#44000000"
        }


    }

    Rectangle {
        anchors.fill: parent
        anchors.margins: 1

        ScrollView {
            anchors.fill: parent
            anchors.margins: 12
            anchors.topMargin: 18
            clip: true

            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

            ListView {
                id: lv
                anchors.fill: parent
                width: parent.width
                height: parent.height
                model:  ListModel {}
                spacing: 12
                delegate: Cust.VideoDelegate {}

                Component.onCompleted: {
                    lv.model.append({
                        'title': 'Sprite Fun',
                        'thumbnail': '../sprite.jpg',
                        'link': '',
                        'percent': 49,
                        'file_path': ""
                    })
                }
            }

        }

    }

    background: Rectangle {
        color: "#44000000"

        Rectangle {
            anchors.fill: parent
            anchors.margins: 1
        }

    }

    Connections {
        target: downloader

        function onDownloaded(ind, filepath) {
            lv.model.get(ind).percent = 0;
            lv.model.get(ind).file_path = filepath
        }

        function onProgressChanged(ind, per) {
            lv.model.get(ind).percent = per;
        }

        function onReturnVideoInfo(video_info) {
            lv.model.append(video_info[0])
        }
    }

}
```

In the above code, we have added a `Connections` type and handled all three signals. A signal handler's name is strictly based on the name of the `Signal` itself. For example, a `Signal` by name `activated` will strictly have a signal handler by name `onActivated`, 'on' + the title case of the name, nothing more, nothing less. But it's strict. So you can see that we have `onDownloaded` for the `downloaded` signal, and so on.

All the signal handlers are modifying the `model` but only one is appending to it.

Now we won't need the data we are appending in the `Component.onCompleted`. Let us delete the entire `Component.onCompleted` function.

> main.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "./customs" as Cust

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: "Downloader"

    flags: Qt.FramelessWindowHint | Qt.Window

    property QtObject downloader
    property int old_x
    property int old_y
    property bool press: false

    header: Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            margins: 1
        }
        width: parent.width
        height: 78
        color: "transparent"


        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onPressed: {
                old_x = mouse.x
                old_y = mouse.y
                press = true
            }

            onReleased: {
                press = false
            }

            onPositionChanged: {
                let new_x = mouse.x - old_x
                let new_y = mouse.y - old_y
                if(press) {
                    mainWindow.x = mainWindow.x + new_x
                    mainWindow.y = mainWindow.y + new_y
                }
            }
        }

        ColumnLayout {
            anchors.fill: parent

            Rectangle {
                Layout.fillWidth: true
                height: 18

                Row {
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 4

                    Cust.CloseButton {
                        onClicked: {
                            mainWindow.showMinimized()
                        }
                    }

                    Cust.CloseButton {
                        bg_color: "dimgrey"

                        onClicked: {
                            mainWindow.close()
                        }

                    }

                }

            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 60

                RowLayout {
                    anchors.centerIn: parent
                    height: 36
                    spacing: 12

                    TextField {
                        id: url_field
                        placeholderText: "https://"

                        background: Rectangle {
                            implicitWidth: 380
                            implicitHeight: 30
                            radius: 15
                            border.color: "darkgrey"
                        }
                    }

                    Button {
                        text: "Search"

                        background: Rectangle {
                            implicitWidth: 80
                            height: 30
                            radius: 15
                            border.color: "darkgrey"
                            color: parent.down ? "dimgrey" : "white"
                        }

                        contentItem: Text {
                            text: parent.text
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            color: parent.down ? "white" : "dimgrey"
                        }

                        onClicked: downloader.search_video(url_field.text)
                    }

                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 24
                    height: 1
                    color: "darkgrey"
                    anchors.bottom: parent.bottom
                }

            }
        }

        Rectangle {
            width: parent.width
            height: 1
            anchors.top: parent.top
            color: "#44000000"
        }


    }

    Rectangle {
        anchors.fill: parent
        anchors.margins: 1

        ScrollView {
            anchors.fill: parent
            anchors.margins: 12
            anchors.topMargin: 18
            clip: true

            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

            ListView {
                id: lv
                anchors.fill: parent
                width: parent.width
                height: parent.height
                model:  ListModel {}
                spacing: 12
                delegate: Cust.VideoDelegate {}
            }

        }

    }

    background: Rectangle {
        color: "#44000000"

        Rectangle {
            anchors.fill: parent
            anchors.margins: 1
        }

    }

    Connections {
        target: downloader

        function onDownloaded(ind, filepath) {
            lv.model.get(ind).percent = 0;
            lv.model.get(ind).file_path = filepath
        }

        function onProgressChanged(ind, per) {
            lv.model.get(ind).percent = per;
        }

        function onReturnVideoInfo(video_info) {
            console.log(video_info[0].thumbnail)
            lv.model.append(video_info[0])
        }
    }

}
```

All done.

You should test your downloader with these three links and expect the videos to be downloaded into the folder specified by the `self.output_folder`.

You can use these links below to get the same view as mine. :)

https://www.youtube.com/watch?v=aqz-KE-bpKQ

https://www.youtube.com/watch?v=_cMxraX_5RE

https://www.youtube.com/watch?v=SkVqJ1SGeL0
