# Slider

A Slider is used to select a value by sliding a handle along a track. It is often used for volume control and song position seeking.

## Basic use

A Slider is found in the QtQuick.Controls package. Normally, you specify `from` and `to` properties to set a range for the Slider. If you do not specify the `from` and `to` properties the range of the Slider will be from 0.0 to 1.0

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Slider"

    Slider {
        anchors.centerIn: parent
        from: 0
        to: 100
    }
}

```

The value property holds the selected value after the slider has been moved. It can also be set manually if you desire. To get the value, you can respond to the moved signal, which is emitted whenever the signal has been moved.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Slider"

    Slider {
        anchors.centerIn: parent
        from: 0
        to: 100

        onMoved: {
            print(this.value)
        }
    }
}

```

When you run the code above, you noticed that we were getting numbers like 4.249345, this can prevented with stepping. 

## Modifying the Slider

To control the numbers you can specify the stepSize property.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Slider"

    Slider {
        anchors.centerIn: parent
        from: 0
        to: 100
        stepSize: 1

        onMoved: {
            print(this.value)
        }
    }
}

```

Now you can see that we no longer get decimal numbers like 3.23448, but rather we only get whole numbers. You could have also used a stepSize of 0.1 or 10 if you so desired.

You can change the orientation of the Slider to become a vertical slider by setting the orientation property.

```qml
import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    visible: true
    width: 800
    height: 400
    title: "Slider"

    Slider {
        anchors.centerIn: parent
        orientation: Qt.Vertical
        from: 0
        to: 100
        stepSize: 1

        onMoved: {
            print(this.value)
        }
    }
}

```

Qt.Horizontal will make the Slider horizontal it is the default value for the orientation though.
