import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Layouts

Component {

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            id: viewerParent
            anchors.fill: parent
            color: "transparent"
            clip: true

            Image {
                id: viewer
                anchors.centerIn: parent
                width: parent.width
                height: parent.height
                sourceSize.width: 1333
                sourceSize.height: 2000
                fillMode: Image.PreserveAspectFit
                source: "file:///C:/Users/workgroup/Pictures/Saved Pictures/pexels-araz-yurtseven-12531788.jpg"
            }

        }

        ControlBar {
        }

        RowLayout {
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width
            height: 48

            CustNavButton {
                text: "\uE76B"
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 18
            }

            CustNavButton {
                text: "\uE76C"
                Layout.alignment: Qt.AlignRight
                Layout.preferredWidth: 18
            }

        }

        RowLayout {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 12
            width: 132
            height: 30
            spacing: 0

            ZoomButton {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "\uEA4B"
            }
            ZoomButton {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "\uE949"
            }
            ZoomButton {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "\uE948"
            }
        }

    }

}
