# Build A Clone Of Windows' Photos App

Lets start



In developing our app, there are two approaches we can take. 1) Top-Down approach where we and 2) bottom-up






We will be using the Top-down approach, because it is more real world like. Before you create a functionality for a button, the button should be there in the UI. In our case before you get an image to show, you should know where you want to show it and the window size you want to show it in, and so on. So it will be good to start with the UI first and then later connect the Python to it as a backend.



For our UI we will be using QML. Javascript-like styling language.



Lets setup our project folders however

Create a folder

Create another UI folder

Create a main.py file

Create a main.qml file inside the UI folder.



Now open the main.qml file and add our window code

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

### Running our QML file

1. Open Ninja-Preview

2. Drag and Drop the `main.qml` file into it

3. Click the green play button to run the file



![](D:\GitHub\Articulae\mds\images\ninja_preview_run.PNG)



You should see a basic window with

[Image]



Since we have already imported our s niversal styling which makes our controls look like that of the windows Universal style, we can set a dark theme



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

Now you should see

[Image]

Now you can see that the only thing that doesn't look like a the windows photos app is the title bar, which we will handle



Now you can see that everything else draws on top of the image viewer.

The photos app allows multiple view type. For the sake of brevity, which shall focus on only the



So lets start by adding a stack view which we would have used even if we implemented the other view.



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

    Comp.IndividualView {id: individual }

}

```

The main changes were, we imported the folder that contains and namespaced it.



`import "./components" as Comp`, then we call the component ( components don't draw on default) and give it an id and then assigns it.

`initialItem: individual`

Now if you run it you would see aa blue window now.
