import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts


ToolBar {
    id: toolbar
    width: parent.width
    height: 48


    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"

            ToolButton {
                id: ctrl
                text: "View all photos"
                width: 148
                height: 48
            }

        }

        CustToolButton {
            text: "\ue72d"
            description: "share"
            tip: "share"
        }

        CustToolButton {
            text: "\ue786"
            description: "slideshow"
            tip: "slideshow"
        }

        CustToolButton {
            text: "\ue70f"
            description: "Edit"
            tip: "Edit"
        }
        CustToolButton {
            text: "\ue7ad"
            description: "Rotate"
            tip: "Rotate"
        }
        CustToolButton {
            text: "\ue74d"
            description: "Delete"
            tip: "Delete"
        }

        MenuBar {
            font.pixelSize: 20
            font.family: segoe_mdl2.name
            Layout.preferredWidth: 46
            Layout.fillHeight: true

            Menu {
                title: "..."

                onAboutToShow: {
                    toolbar.height = 64
                }
                onAboutToHide: {
                    toolbar.height = 48
                }

                Action{
                    text: "Open with"
                }
                Action {
                    text: "Copy"
                }
                Action {
                    text: "Print"
                }
                Action {
                    text: "Set as"
                }
                MenuSeparator {}
                Action {
                    text: "File info"
                }
            }


        }

    }




    background: Rectangle {
        color: "#90202020"
    }

}
