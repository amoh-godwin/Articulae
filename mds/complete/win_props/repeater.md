# Repeator

[text]



## Basic Repeater

[text] Basic with integer model

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Repeater"

    GridLayout {
        anchors.fill: parent
        columns: 3


        Repeater {
            model: 10


            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "dodgerblue"
            }

        }

    }


}

```



## Using ListModel

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400
    title: "Repeater"

    GridLayout {
        anchors.fill: parent
        columns: 2


        Repeater {
            model: ListModel {
                ListElement {
                    bg_color: "dodgerblue"
                    text_color: "white"
                }
                ListElement {
                    bg_color: "gold"
                    text_color: "cyan"
                }
                ListElement {
                    bg_color: "navy"
                    text_color: "white"
                }
                ListElement {
                    bg_color: "cyan"
                    text_color: "gold"
                }

            }


            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: bg_color

                Text {
                    anchors.centerIn: parent
                    text: "Cake"
                    color: text_color
                }

            }

        }

    }


}

```



## Implementing a dynamic size Grid

[text]

`code2.qml`

[text]


