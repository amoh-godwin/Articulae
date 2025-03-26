# RadioButton

[text]

## Basic use

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 480
    title: "Radio Button"

    RowLayout {
        width: parent.width
        height: 48

        RadioButton {
            text: "Male"
        }

        RadioButton {
            text: "Female"
        }

        RadioButton {
            text: "Non binary"
        }

    }


}

```

[text]

If they are not directly siblings.

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 480
    title: "Radio Button"

    ColumnLayout {
        width: parent.width
        height: parent.height

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            RadioButton {
                text: "Male"
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            RadioButton {
                text: "Female"
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            RadioButton {
                text: "Non binary"
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

    }


}

```

[text]

## ButtonGroup

[text]

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 480
    title: "Radio Button"

    ColumnLayout {
        width: parent.width
        height: parent.height

        ButtonGroup {
            id: btn_group
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            RadioButton {
                text: "Male"
                ButtonGroup.group: btn_group
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            RadioButton {
                text: "Female"
                ButtonGroup.group: btn_group
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            RadioButton {
                text: "Non binary"
                ButtonGroup.group: btn_group
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

    }


}

```

[text]

You can also do it directly

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 480
    title: "Radio Button"

    ColumnLayout {
        width: parent.width
        height: parent.height

        ButtonGroup {
            id: btn_group
            buttons: radio_rows.children
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            color: "dodgerblue"
        }

        RowLayout {
            id: radio_rows
            Layout.fillWidth: true
            Layout.preferredHeight: 48

            RadioButton {
                text: "Male"
            }

            RadioButton {
                text: "Female"
            }

            RadioButton {
                text: "Non binary"
            }

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }





    }


}

```

[text]



## Checkbox

[text]

with exclusive button set to false

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 480
    title: "Radio Button"

    ColumnLayout {
        width: parent.width
        height: parent.height

        ButtonGroup {
            id: btn_group
            buttons: radio_rows.children
            exclusive: false
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            color: "dodgerblue"
        }

        RowLayout {
            id: radio_rows
            Layout.fillWidth: true
            Layout.preferredHeight: 48

            CheckBox {
                text: "JavaScript"
            }

            CheckBox {
                text: "Python"
            }

            CheckBox {
                text: "Java"
            }

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }





    }


}

```

[text]

You can use buttongroup

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 480
    title: "Radio Button"

    ColumnLayout {
        width: parent.width
        height: parent.height

        ButtonGroup {
            id: btn_group
            buttons: radio_rows.children
            exclusive: false
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            color: "dodgerblue"
        }

        CheckBox {
            text: "Select all"
            checkState: btn_group.checkState
        }

        ColumnLayout {
            id: radio_rows
            Layout.fillWidth: true
            Layout.preferredHeight: 48

            CheckBox {
                text: "JavaScript"
            }

            CheckBox {
                text: "Python"
            }

            CheckBox {
                text: "Java"
            }

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }





    }


}

```

[text]

You can set tristate

```qml
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


ApplicationWindow {
    visible: true
    width: 800
    height: 480
    title: "Radio Button"

    ColumnLayout {
        width: parent.width
        height: parent.height

        ButtonGroup {
            id: btn_group
            buttons: radio_rows.children
            exclusive: false
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            color: "dodgerblue"
        }

        CheckBox {
            text: "Select all"
            checkState: btn_group.checkState
        }

        ColumnLayout {
            id: radio_rows
            Layout.fillWidth: true
            Layout.preferredHeight: 48

            CheckBox {
                text: "JavaScript"
            }

            CheckBox {
                text: "I know a lot of Python"
                tristate: true
            }

            CheckBox {
                text: "Java"
            }

        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }





    }


}

```

[text]
