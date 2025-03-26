# MenuBar

A menuBar draws a bar to hold a set of menu's

## Basic use

A menuBar is found in the QtQuick.Controls.Basic import. You can use it by calling the MenuBar object.

The menu's title will be displayed as buttons on the bar.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "MenuBar"


    MenuBar {
        Menu {
            title: "File"

            Action {
                text: "Open"
            }
        }

        Menu {
            title: "Edit"

            Action {
                text: "Undo"
            }

            Action {
                text: "Redo"
            }
        }
    }

}

```

## Reacting to key presses

You can use the ampersand (&) character to denote shortcut character.

This way by pressing Alt+the letter right after the ampersand the corresponding menu will open

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "MenuBar"


    MenuBar {
        Menu {
            title: "&File"

            Action {
                text: "Open"
            }
        }

        Menu {
            title: "Ed&it"

            Action {
                text: "Undo"
            }

            Action {
                text: "Redo"
            }
        }
    }

}

```

## Adding menu dynamically

Menu's can added to the MenuBar dynamically using any of addMenu or insertMenu methods. Lets see the addMenu in action.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "MenuBar"


    MenuBar {

        Menu {
            title: "&File"

            Action {
                text: "Open"
            }
        }

        Menu {
            title: "Ed&it"

            Action {
                text: "Undo"
            }

            Action {
                text: "Redo"
            }
        }

        Component.onCompleted: {
            var obj_text = '
import QtQuick
import QtQuick.Controls.Basic

Menu {
        id: dd
        title: "About"

        Action {
            text: "About the Company"
        }

        Action {
            text: "License"
        }

    }
'
            var menu1 = Qt.createQmlObject(obj_text, this)
            var menu2 = Qt.createQmlObject(obj_text, this)
            addMenu(menu1)
            menu2.title = "&Tools"
            addMenu(menu2)
        }


    }

}

```

You can practice in the playground how to insert a menu using the insertMenu. insertMenu takes the index as the first parameter and a Menu as the second parameter
