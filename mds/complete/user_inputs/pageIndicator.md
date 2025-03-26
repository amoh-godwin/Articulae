# Page Indicator

A PageIndicator provides a way to visualize the page you are currently when using a container that handles multiple pages.

## Basic use

A PageIndicator is in the QtQuick.Controls.Basic package. It can be used by calling the PageIndicator object

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Page Indicator"

    SwipeView {
        id: view
        anchors.fill: parent

        Rectangle {
            color: "dodgerblue"
        }

        Rectangle {
            color: "gold"
        }

        Rectangle {
            color: "pink"
        }

        Rectangle {
            color: "teal"
        }
    }

    PageIndicator {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        count: view.count
        currentIndex: view.currentIndex
    }

}

```

[text]

## Interactiveness

You can make a PageIndicator clickable. Then the clicked entry will become the current Index. If for instance the currentIndex of the PageIndicator is bound to the currentIndex of a SwipeView, it will control which page is the current page.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Page Indicator"

    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: indicator.currentIndex

        Rectangle {
            color: "dodgerblue"
        }

        Rectangle {
            color: "gold"
        }

        Rectangle {
            color: "pink"
        }

        Rectangle {
            color: "teal"
        }
    }

    PageIndicator {
        id: indicator
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        count: view.count
        currentIndex: view.currentIndex
        interactive: true
    }

}

```

## Customization

You can cusomize the look and feel of a PageIndicator.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Page Indicator"

    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: indicator.currentIndex

        Rectangle {
            color: "dodgerblue"
        }

        Rectangle {
            color: "gold"
        }

        Rectangle {
            color: "pink"
        }

        Rectangle {
            color: "teal"
        }
    }

    PageIndicator {
        id: indicator
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        count: view.count
        currentIndex: view.currentIndex
        interactive: true

        delegate: Rectangle {
            property bool current: index === indicator.currentIndex
            implicitWidth: current ? 12 : 5
            implicitHeight: 15

            opacity: index === indicator.currentIndex ? 0.65 : 0.5


            NumberAnimation on implicitWidth {
                running: current
                from: 5
                to: 12
                duration: 250
            }
        }
    }

}

```

From the code above you can see that the PageIndictor's circle indicators have been made Rectangular and then they change in size when they become the current entry.
