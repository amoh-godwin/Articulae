# Menu

A menu provide a set of option referred to as actions or menuitems that can be clicked to perform certain functions.

## Basic use

A menu is found in the QtQuick.Controls.Basic package. You can use it by calling the Menu object.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Menu"

    Menu {
        visible: true

        MenuItem {
            text: "Open"
        }

        MenuItem {
            text: "Save"
        }
    }



}

```

The title of the menu is not drawn yet, because the title of the menu is displayed as an entry in a menuBar. We will discuss a menubar is the next lesson.

## Nested Menu

A menu can be nested inside another menu to create a deep menu.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Menu"

    Menu {
        visible: true

        MenuItem {
            text: "Open"
        }

        MenuItem {
            text: "Save"
        }

        Menu {
            title: "Recent files"

            MenuItem {
                text: "File.txt"
            }

            MenuItem {
                text: "File1.txt"
            }

        }
    }



}

```

We could have used Action instead of menuItem.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Menu"

    Menu {
        visible: true

        Action {
            text: "Open"
        }

        Action {
            text: "Save"
        }

        Menu {
            title: "Recent files"

            Action {
                text: "File.txt"
            }

            Action {
                text: "File1.txt"
            }

        }
    }



}

```

## Shortcuts in Action

[text]

## Handling Events

You can respond using the trigerred events.

An Action's ontriggered signal includes the object that triggered the action as a source

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Menu"

    Menu {
        visible: true

        Action {
            text: "Open"

            onTriggered: {
                print(source + ": Open triggered")
            }
        }

        MenuItem {
            text: "Save"

            onTriggered: {
                print("Save pressed")
            }
        }

    }



}

```
