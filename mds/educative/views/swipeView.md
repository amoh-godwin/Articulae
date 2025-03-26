# SwipeView

A `SwipeView` is a container for navigating between pages through swiping.

## Basic use

A `SwipeView` is found in the `QtQuick.Controls.Basic` package. You can use it by calling the `SwipeView` object as seen in the code below **(Lines 9 - 22)**. The pages that will be swiped will have to be declared directly inside of the `SwipeView`.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400

    SwipeView {
        anchors.fill: parent

        Rectangle {
            color: "pink"
        }
        Rectangle {
            color: "dodgerblue"
        }
        Rectangle {
            color: "gold"
        }

    }

}
```

A basic implementation of a SwipeView with three Rectangles as three pages

From the code above, you can see that there are three items declared inside of a `SwipeView`. Each of the items will act as a separate page. When you run this, you should be able to swipe between three `Rectangle`s as three pages.

## Background property

There is a `background` property for the `SwipeView`, with it you can do interesting things with the view. For instance, it can be used to make the background of the view transparent as seen in **line 29** of the code below.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400

    Rectangle {
        anchors.fill: parent
        color: "dodgerblue"
    }

    SwipeView {
        id: sview
        anchors.fill: parent


        Rectangle {
            color: "#23ffffff"
        }

        Rectangle {
            color: "#23000000"
        }


        background: Rectangle {
            color: "transparent"
        }


    }

}
```

A SwipeView with a background parameter set

When you run the above code, you can see that the bottom `Rectangle` with a `color` of `dodgerblue` is rather visible, and that the two items in the `SwipeView` are all partly transparent, which enables us to see the base dodgerblue `Rectangle` through them.

## Orientation

The `orientation` property controls whether the `SwipeView` is scrollable vertically or horizontally. The default is to scroll it horizontally. `Qt.Vertical` and `Qt.Horizontal` are used to set the scroll to either vertical-scroll or horizontal-scroll respectively.
In the code below, we set the `orientation` to `Qt.Vertical` as seen in **line 11** of the code.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400

    SwipeView {
        anchors.fill: parent
        orientation: Qt.Vertical

        Rectangle {
            color: "pink"
        }
        Rectangle {
            color: "dodgerblue"
        }
        Rectangle {
            color: "gold"
        }

    }

}
```

A SwipeView with the orientation set to Qt.Vertical

When you run the code above, you can see that now you scroll by swiping either from top to bottom or from bottom to top rather that from left to right or from right to left.
