# TableView

A `TableView` provides a view for displaying data from a model in a table form

## Basic use

A `TableView` is found in the `QtQuick.Controls` package, it uses data from a `TableModel` or a C++ model.

```qml
import QtQuick
import QtQuick.Controls.Basic
import Qt.labs.qmlmodels 1.0


ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: ""

    TableView {
        anchors.centerIn: parent
        width: 300
        height: 150
        columnSpacing: 1
        rowSpacing: 1
        clip: true

        model: TableModel {
            TableModelColumn { display: "product" }
            TableModelColumn { display: "category" }
            TableModelColumn { display: "cost" }

            rows: [
                {
                    "product": "Coco-Cola",
                    "category": "Soda",
                    "cost": "$0.99"
                },
                {
                    "product": "Pepsi",
                    "category": "Soda",
                    "cost": "$1.00"
                },
                {
                    "product": "American-Cola",
                    "category": "Soda",
                    "cost": "$1.00"
                }
            ]
        }

        delegate: Rectangle {
            implicitWidth: 100
            implicitHeight: 50
            color: "lightsteelblue"

            Text {
                text: display
                anchors.centerIn: parent
            }
        }
    }


}

```

In the above code, in **lines 20 - 42**, we have a `TableModel`, and in **lines 21 - 23**, we have defined three `TableModelColumn`'s. These `TableModelColumn`'s will define the columns and properties that the rows of the `TableModel` will use. So, you can see these properties have been specified when we declared the `rows` in **lines 25 - 42**.

## Editable

The cells of a `TableView` can be made editable. It can case we specify an editable control for the attached property `editDelegate`. You can activate the edit mode when the cell gets double-clicked.

```qml
import QtQuick
import QtQuick.Controls.Basic
import Qt.labs.qmlmodels 1.0


ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: ""

    TableView {
        anchors.centerIn: parent
        width: 300
        height: 150
        columnSpacing: 1
        rowSpacing: 1
        clip: true

        model: TableModel {
            TableModelColumn { display: "product" }
            TableModelColumn { display: "category" }
            TableModelColumn { display: "cost" }

            rows: [
                {
                    "product": "Coco-Cola",
                    "category": "Soda",
                    "cost": "$0.99"
                },
                {
                    "product": "Pepsi",
                    "category": "Soda",
                    "cost": "$1.00"
                },
                {
                    "product": "American-Cola",
                    "category": "Soda",
                    "cost": "$1.00"
                }
            ]
        }

        delegate: Rectangle {
            implicitWidth: 100
            implicitHeight: 50
            color: "lightsteelblue"

            Text {
                text: display
                anchors.centerIn: parent
            }

            TableView.editDelegate: TextField {
                anchors.fill: parent
                TableView.onCommit: {
                    display = text
                }
            }
        }
    }


}

```

In the above code, in **lines 54 - 59**, we have set a `TextField` to the `editDelegate`. We will learn more about `TextField` in the User controls section of this course. But all you need to know now is that, when the edit is accepted by clicking the enter, the `TextField`'s text property will be set to the `display` property of the cell that was being edited.

## Resizable

A `TableView` can be resized. You can either make its column resizable or its row resizable or both.

```qml
import QtQuick
import QtQuick.Controls.Basic
import Qt.labs.qmlmodels 1.0


ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: ""

    ScrollView {
        anchors.fill: parent

        TableView {
            id: tb_view
            anchors.centerIn: parent
            width: 300
            height: 150
            columnSpacing: 1
            rowSpacing: 1
            clip: true
            resizableColumns: true
            resizableRows: true

            model: TableModel {
                TableModelColumn { display: "product" }
                TableModelColumn { display: "category" }
                TableModelColumn { display: "cost" }

                rows: [
                    {
                        "product": "Coco-Cola",
                        "category": "Soda",
                        "cost": "$0.99"
                    },
                    {
                        "product": "Pepsi",
                        "category": "Soda",
                        "cost": "$1.00"
                    },
                    {
                        "product": "American-Cola",
                        "category": "Soda",
                        "cost": "$1.00"
                    },
                    {
                        "product": "Coco-Cola",
                        "category": "Soda",
                        "cost": "$0.99"
                    },
                    {
                        "product": "Pepsi",
                        "category": "Soda",
                        "cost": "$1.00"
                    },
                    {
                        "product": "American-Cola",
                        "category": "Soda",
                        "cost": "$1.00"
                    },
                    {
                        "product": "Coco-Cola",
                        "category": "Soda",
                        "cost": "$0.99"
                    },
                    {
                        "product": "Pepsi",
                        "category": "Soda",
                        "cost": "$1.00"
                    },
                    {
                        "product": "American-Cola",
                        "category": "Soda",
                        "cost": "$1.00"
                    }
                ]
            }


            delegate: Rectangle {
                implicitWidth: 100
                implicitHeight: 50
                color: "lightsteelblue"

                Text {
                    text: display
                    anchors.centerIn: parent
                }

                TableView.editDelegate: TextField {
                    anchors.fill: parent
                    TableView.onCommit: {
                        display = text
                    }
                }
            }
        }



    }

}

```

A `TableView` can be used to display data from a Pandas dataframe.
