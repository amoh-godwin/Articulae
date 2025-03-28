# Dialogs

A `Dialog` is a popup take requires you to perform some action before resuming with whatever that you want to do. There are several dialogs in QML, a normal dialog, a file dialog and a folder dialog. A basic dialog is found in the `QtQuick.Controls.Basic` package, but a `FileDialog` and a `FolderDialog` are both found in the `QtQuick.Dialogs` package.

## Basic Dialog

A basic `Dialog` gives you a popup that insists the user selects an option by clicking a button before continuing with whatever the user wants to do.

```qml
import QtQuick
import QtQuick.Controls.Basic


ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Dialog"


    Dialog {
        id: dialog
        title: "Are you sure you want to close"
        standardButtons: Dialog.Ok | Dialog.Cancel

        onAccepted: {
            print("I still insist on closing")
        }

        onRejected: {
            print("No it was a mistake, cancel the closing")
        }
    }

    Button {
        text: "Open Dialog"
        onClicked: {
            dialog.open()
        }
    }

}

```

The standard button could have been just one. That one the `Dialog` is to provide a information to the user.

## File Dialog

A `FileDialog` provides a popup that allows the user to select a file available on the computer or to create a new path to a file. We can get the file the user selected or created using the `selectedFile` property.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Dialogs


ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Dialogs"

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        id: display
        text: ""
    }

    Button{
        anchors.top: display.bottom
        text: "Open"
        onClicked: {
            dialog.open()
        }
    }

    FileDialog {
        id: dialog
        onAccepted: display.text = selectedFile
    }

}

```

- Setting location for current folder
  
  You can set a folder which will be opened when the `FileDialog` first opens. The current folder must use the file protocol and hence should be a full path.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Dialogs


ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Dialogs"

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        id: display
        text: ""
    }

    Button{
        anchors.top: display.bottom
        text: "Open"
        onClicked: {
            dialog.open()
        }
    }

    FileDialog {
        id: dialog
        currentFolder: "file://"
        onAccepted: display.text = selectedFile
    }

}

```

- fileMode - You can choose if the `FileDialog` will alow a user to select a single file or multiple files using the `fileMode` property. You can even choose if the user can create a new folder and write a new file name which doesn't exist. This mostly used for saving files where the user chooses the name of the file and the path to be save to.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Dialogs


ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Dialogs"

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        id: display
        text: ""
    }

    Button{
        anchors.top: display.bottom
        text: "Save"
        onClicked: {
            dialog.open()
        }
    }

    FileDialog {
        id: dialog
        fileMode: FileDialog.SaveFile
        onAccepted: display.text = selectedFile
    }

}

```

For FileDialog.ReadFiles the `selectedFiles` property should be used to get the files, it is a list of urls.

- nameFilters - You can restrict the files that can be selected by using the `nameFilters` property

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Dialogs


ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Dialogs"

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        id: display
        text: ""
    }

    Button{
        anchors.top: display.bottom
        text: "Open"
        onClicked: {
            dialog.open()
        }
    }

    FileDialog {
        id: dialog
        fileMode: FileDialog.OpenFile
        onAccepted: display.text = selectedFile
        nameFilters: [
            "Text files (*.txt)",
            "Image files (*.jpeg *.jpg *png)",
            "All files (*.*)"
        ]
    }

}

```

This time the user will get a drop down to select either text files, image files or all files.

## Folder Dialog

A `FolderDialog` is just like a `FileDialog`, the only difference is that allows a user to select directories instead of a file

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Dialogs


ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Dialogs"

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        id: display
        text: ""
    }

    Button{
        anchors.top: display.bottom
        text: "Open"
        onClicked: {
            dialog.open()
        }
    }

    FolderDialog {
        id: dialog
        onAccepted: {
            display.text = selectedFolder
        }
    }

}

```

You can create new directory and select them.
