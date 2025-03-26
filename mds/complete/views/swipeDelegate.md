# Swipe Delegate

A `SwipeDelegate` provides a delegate with swipe functionality for a `ListView` or any other view that will require it.

## Basic use

A `SwipeDelegate` is found in the `QtQuick.Controls`. It can be used, where you would place a delegate. The code below places a `Rectangle` at the left side of a `ListView` `delegate`. You can swipe from left to right on any of the entries of the `ListView` to see it.

```qml
import QtQuick
import QtQuick.Controls.Basic


ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Swipe Delegate"

    ListView {
        anchors.fill: parent
        model: ["Kweku the traveller.mp3", "Mr. morale.mp3", "Lift me up.mp3"]
        delegate: SwipeDelegate {
            width: ListView.view.width
            height: 48
            text: modelData

            swipe.left: Rectangle {
                width: 48
                height: parent.height
                color: "red"

                Text {
                    anchors.centerIn: parent
                    text: "remove"
                    color: "white"
                }
            }

        }
    }

}

```

In the code above, from **lines 19 to 28** the swipe item was placed at the left side of the `ListView` delegates. If you want it to show up on the right side, you should use `swipe.right` instead. But in doing so, do not forget to use `anchors` to bring the item itself to the right side of the delegate.

```qml
import QtQuick
import QtQuick.Controls.Basic


ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Swipe Delegate"

    ListView {
        anchors.fill: parent
        model: ["Kweku the traveller.mp3", "Mr. morale.mp3", "Lift me up.mp3"]
        delegate: SwipeDelegate {
            width: ListView.view.width
            height: 48
            text: modelData

            swipe.right: Rectangle {
                anchors.right: parent.right
                width: 48
                height: parent.height
                color: "red"

                Text {
                    anchors.centerIn: parent
                    text: "remove"
                    color: "white"
                }
            }

        }
    }

}

```

From the code above, you can see that the item which is set to the `swipe.right` property has been anchored to its `parent`, which is the `SwipeDelegate`.

## Responding to a click event

The swipe item can be clicked and provides a `SwipeDelegate.clicked` attached signal. Lets see this in action.

```qml
import QtQuick
import QtQuick.Controls.Basic


ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Swipe Delegate"

    ListView {
        id: l_view
        anchors.fill: parent
        model: ListModel {
            ListElement {
                name: "Kweku the traveller.mp3"
            }
            ListElement {
                name: "Mr. morale.mp3"
            }
            ListElement {
                name: "Lift me up.mp3"
            }
        }
        delegate: SwipeDelegate {
            width: ListView.view.width
            height: 48
            text: modelData

            swipe.right: Rectangle {
                anchors.right: parent.right
                width: 48
                height: parent.height
                color: SwipeDelegate.pressed ? Qt.darker("red", 1.5) : "red"

                SwipeDelegate.onClicked: {
                    print("I can handle other functionality as well")
                    l_view.model.remove(index)
                }

                Text {
                    anchors.centerIn: parent
                    text: "remove"
                    color: "white"
                }
            }

        }
    }

}

```

For the model’s `remove` function to work as we have in the above code example in **line 38**, you have to be using a data model as the `ListModel` which provides a `remove` method.
