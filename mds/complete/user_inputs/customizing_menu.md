# Customizing Menu

Customizing a menu could be one of the most satisfying things to know. You will almost always desire and appreciate a unique menu. It could be the color scheme, it could be the hover style or even the popup that draws beneath the menu bar.

## Customizing the MenuBar

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 400

    MenuBar {
        Menu {
            title: "&File"
        }
        Menu {
            title: "&Edit"
        }
        Menu {
            title: "&View"
        }
        Menu {
            title: "&Help"
        }

        background: Rectangle {
            implicitWidth: 800
            color: "black"
        }



    }
}

```



The menuBar itself has a background property. But the menu entries will draw on top of it. The menu entries are handled by a delegate which uses MenuItem, so we should customize the menuItem. The MenuItem has a background and contentItem properties that can be modified.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 400

    MenuBar {
        Menu {
            title: "File"
        }
        Menu {
            title: "Edit"
        }
        Menu {
            title: "Settings"
        }
        Menu {
            title: "Help"
        }

        background: Rectangle {
            implicitWidth: 800
            color: "black"
        }

        delegate: MenuBarItem {
            id: mBI
            contentItem: Text {
                text: mBI.text
                font: mBI.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: mBI.hovered? "black" :"white"
            }

            background: Rectangle {
                implicitHeight: 48
                color: "transparent"

                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width
                    height: 32
                    radius: height /2
                    color: mBI.hovered ? "white" : "transparent"
                }


            }
        }



    }
}

```

In the above code, you can see that we have modified both the contentItem and the background of the menuItem.



## Customizing the Menu

We can also customize the Menu itself the same way we customize the menuBar. We can customize the background of the Menu, but the entries are drawn as delegates.  MenuItems are used as the delegates. A MenuItem has a background, contentItem, indicator and an arrow to show in if a Menu contains another menu.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 400

    MenuBar {
        Menu {
            title: "File"

            Action {text: "New"}
            Action {text: "Open" }
            Action {text: "General" }

            background: Rectangle {
                implicitWidth: mainWindow.width
                implicitHeight: 200
                color: "black"
            }

            delegate: MenuItem {
                id: menuItem

                background: Rectangle {
                    width: cnt.contentWidth + 24
                    implicitHeight: 40
                    color: "transparent"

                    Rectangle {
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.width - 8
                        height: parent.height - 6
                        radius: height / 2
                        color: menuItem.hovered ? "white" : "transparent"
                    }

                }


                contentItem: Text {
                    id: cnt
                    verticalAlignment: Text.AlignVCenter
                    text: menuItem.text
                    font: menuItem.font
                    color: menuItem.hovered ? "black" : "white"
                }
            }


        }
        Menu {
            title: "Edit"
        }
        Menu {
            title: "Settings"
        }
        Menu {
            title: "Help"
        }

        background: Rectangle {
            implicitWidth: 800
            color: "black"
        }

        delegate: MenuBarItem {
            id: mBI
            contentItem: Text {
                text: mBI.text
                font: mBI.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: mBI.hovered? "black" :"white"
            }

            background: Rectangle {
                implicitHeight: 48
                color: "transparent"

                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width
                    height: 32
                    radius: height /2
                    color: mBI.hovered ? "white" : "transparent"
                }


            }
        }



    }
}

```

In the above code, you can see that the width of the Menu has been set to the width of the application window.



We should put the custom menu in a custom type so we can reuse it easily.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "." as Cust


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 400

    MenuBar {
        Cust.CustomMenu {
            title: "File"
            width: mainWindow.width

            Action {text: "New"}
            Action {text: "Open" }

        }
        Cust.CustomMenu {
            width: mainWindow.width
            title: "Edit"
        }
        Cust.CustomMenu {
            width: mainWindow.width
            title: "Settings"
        }
        Cust.CustomMenu {
            width: mainWindow.width
            title: "Help"
        }

        background: Rectangle {
            implicitWidth: 800
            color: "black"
        }

        delegate: MenuBarItem {
            id: mBI
            contentItem: Text {
                text: mBI.text
                font: mBI.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: mBI.hovered? "black" :"white"
            }

            background: Rectangle {
                implicitHeight: 48
                color: "transparent"

                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width
                    height: 32
                    radius: height /2
                    color: mBI.hovered ? "white" : "transparent"
                }


            }
        }



    }
}

```

`code3_custom_menu.txt`

We can modify the arrow if there are submenus.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "." as Cust


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 400

    MenuBar {
        Cust.CustomMenu {
            title: "File"

            Action {text: "New"}
            Action {text: "Open" }
            Cust.CustomMenu {
                title: "Recent File"
                Action {text: "new.txt" }
            }

        }
        Cust.CustomMenu {
            title: "Edit"
        }
        Cust.CustomMenu {
            title: "Settings"
        }
        Cust.CustomMenu {
            title: "Help"
        }

        background: Rectangle {
            implicitWidth: 800
            color: "black"
        }

        delegate: MenuBarItem {
            id: mBI
            contentItem: Text {
                text: mBI.text
                font: mBI.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: mBI.hovered? "black" :"white"
            }

            background: Rectangle {
                implicitHeight: 48
                color: "transparent"

                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width
                    height: 32
                    radius: height /2
                    color: mBI.hovered ? "white" : "transparent"
                }


            }
        }



    }
}

```

`code4_custom_menu.txt`

[text]
