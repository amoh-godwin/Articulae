# Listview

[text]

## Basic Use

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 500

    ListView {
        anchors.fill: parent
        model: 5
        delegate: dele
    }

    Component {
        id: dele
        Rectangle {
            width: 800
            height: 40
            border.width: 2

            Text {  
                anchors.verticalCenter: parent.verticalCenter
                text: "C:/filename"
                font.pixelSize: 14
            }
        }
    }

}
```

## Delegate

A delegate has access to a model's properties. We are using a simple model, and we dont' have any property defined. But there is a default property, the property index.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 500

    ListView {
        anchors.fill: parent
        model: 5
        delegate: dele
    }

    Component {
        id: dele
        Rectangle {
            width: 800
            height: 40
            color: index % 2 == 0 ? "lightgrey" : "white"

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "C:/filename " + index
                font.pixelSize: 14
            }
        }
    }

}
```

the delegate can be declared inline and wouldn't need

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 500

    ListView {
        anchors.fill: parent
        model: 5
        delegate:
            Rectangle {
                width: 800
                height: 40
                color: index % 2 == 0 ? "lightgrey" : "white"

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "C:/filename " + index
                    font.pixelSize: 14
                }
            }
    }



}
```

Do not use the width, use ListView.view.width

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 500

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: "lightgrey"
            }

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    Layout.preferredWidth: 200
                    Layout.fillHeight: true

                    Rectangle {
                        anchors.right: parent.right
                        width: 1
                        height: parent.height
                        color: "lightgrey"
                    }

                }


                ListView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    model: 5
                    delegate: Rectangle {
                        width: ListView.view.width
                        height: 40
                        color: index % 2 == 0 ? "lightgrey" : "white"

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: "C:/filename " + index
                            font.pixelSize: 14
                        }
                    }
                }

            }

        }

    }

}
```

To keep things tidy, we can put the delegate in a custom type.

Lets put it a file called FilenameDelegate.qml. This way it will become an object type.

FilenameDelegate.qml

```qml
import QtQuick


Component {
    Rectangle {
        width: ListView.view.width
        height: 40
        color: index % 2 == 0 ? "lightgrey" : "white"

        Text {
            anchors.verticalCenter: parent.verticalCenter
            text: "C:/filename " + index
            font.pixelSize: 14
        }
    }
}
```

main.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "." as MyCust

ApplicationWindow {
    visible: true
    width: 800
    height: 500

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: "lightgrey"
            }

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    Layout.preferredWidth: 200
                    Layout.fillHeight: true

                    Rectangle {
                        anchors.right: parent.right
                        width: 1
                        height: parent.height
                        color: "lightgrey"
                    }

                }


                ListView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    model: 5
                    delegate: MyCust.FilenameDelegate {}
                }

            }

        }

    }

}
```

[text]

## Highlight

[text]

FilenameDelegate.qml

```qml
import QtQuick


Component {
    Rectangle {
        width: ListView.view.width
        height: 40
        color: "transparent"

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 12
            text: "Downloads " + index
            font.pixelSize: 14
        }
    }
}
```

[text]

main.qml

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "." as MyCust

ApplicationWindow {
    visible: true
    width: 280
    height: 500

    ListView {
        anchors.fill: parent
        anchors.topMargin: 4
        model: 7
        delegate: MyCust.FilenameDelegate {}
        highlight: Rectangle {
            color: "#33f4a3"
            radius: 8
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 6
            anchors.rightMargin: 6
        }
        focus: true
    }


}
```

Highlight draws behind the delegate. It has an z index of 0, so its either you change the z-index to be higher than the delegate, which has a z-index of 1 or you set the background of the delegate to be transparent, so important things like texts and icons show.

If you prefer to you can set its z-index to 2 and then play with the opacity values to your  preference.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "." as MyCust

ApplicationWindow {
    visible: true
    width: 280
    height: 500

    ListView {
        anchors.fill: parent
        anchors.topMargin: 4
        model: 7
        delegate: MyCust.FilenameDelegate {}
        highlight: Rectangle {
            z: 2
            opacity: 0.5
            color: "#33f4a3"
            radius: 8
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 6
            anchors.rightMargin: 6
        }
        focus: true
    }


}
```

In the code above, we have `focus: true`, this is what enables us to receive key input in the Listview. It should preferrably be the last property to be set for the Listview. The key input, the Listview is reacting to is just the key navigations. You can disable this by setting keyNavigation: false, you can disable both key and mouse input for the listview by setting interactive: false. For now the only mouse we respond to is just the flicking of the listview itself. Whiles key navigation is enabled, we can move the highlight from the first list entry at the top to the last entry at the bottom, but it doesn't warp back up when we reach the bottom and continue to press the down bottom. It also doesn't do the vice-versa. We can make it warp back by setting the property, keyNavigationWraps, this will make sure the current item selection moves past the end of the list to the start.

`code3.txt`

`code3_filename.txt`

We can handle mouse inputs better using the MouseArea object, which we will study in the User Inputs chapter.

You can show which is the current item without using a highlight component.

`code4.txt`

`code4_filename.txt`

[text]

## Header & Footer

[text]

`code5.txt`

`code5_delegate.txt`

`code5_header.txt`

`code5_footer.txt`

In the code above:

- In **line 4444**, we have the clip set to true. If you set it to false, the listview will overflow its container, the footer will misbehave. You can change it in the code playground to see the effect. 

## Orientation

[text]

`code6.txt`

`code6_horizontal.txt`

[text]

## Snapmode/scrollview

[text]

[text]

## Model

At this time you are feeling the limitation of our simple model.
