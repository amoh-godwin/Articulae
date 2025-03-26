# Tumbler

[text]

## Basic use

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 500
    height: 400

    Tumbler {
        anchors.centerIn: parent
        model: 12
    }

}

```

[text]

## CurrentIndex

It holds the index. It can be set and can also be read to tell which is the current index

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400

    ColumnLayout {
        width: 150
        height: 200
        anchors.centerIn:parent

        Tumbler {
            id: year_tumbler
            Layout.alignment: Qt.AlignHCenter
            currentIndex: 2022
            model: 2030
        }

        Button {
            Layout.alignment: Qt.AlignHCenter
            text: "Set Year"
            onClicked: {
                print(year_tumbler.currentIndex)
            }
        }

    }

}

```

[text]

## Model

We can use a list as a model and also use a ListModel

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400

    ColumnLayout {
        width: 150
        height: 300
        anchors.centerIn:parent

        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: 100

            Tumbler {
                id: day_tumbler
                currentIndex: 2022
                model: ListModel {
                    ListElement {
                        name: "Sunday"
                    }
                    ListElement {
                        name: "Monday"
                    }
                    ListElement {
                        name: "Tuesday"
                    }
                    ListElement {
                        name: "Wednesday"
                    }
                    ListElement {
                        name: "Thursday"
                    }
                    ListElement {
                        name: "Friday"
                    }
                    ListElement {
                        name: "Saturday"
                    }
                }
            }

            Tumbler {
                id: month_tumbler
                currentIndex: 2022
                model: [
                    "January", "February", "March",
                    "April", "May", "June",
                    "July", "August", "September",
                    "October", "November", "December"
                ]
            }

            Tumbler {
                id: year_tumbler
                currentIndex: 2022
                model: 2030
            }

        }

    }

}

```

[text]

### Modifying the delegate

Tumbler.displacement attached property.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 400

    ColumnLayout {
        width: 150
        height: 300
        anchors.centerIn:parent

        Tumbler {
            currentIndex: 2022
            model: 2030
            wrap: true
            delegate: Rectangle {
                color: Qt.lighter("dodgerblue", (Math.abs(2 - Math.abs(Tumbler.displacement)) + 1)/3)
                Text {
                    anchors.centerIn: parent
                    text: modelData
                    opacity: (Math.abs(2 - Math.abs(Tumbler.displacement)) + 1)/3
                }
            }


        }


    }

}

```

[text]

# 
