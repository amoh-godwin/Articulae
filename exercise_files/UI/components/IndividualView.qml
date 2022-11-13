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
                source: "file:///C:/Users/workgroup/Pictures/Saved Pictures/pexels-pixabay-358457.jpg"
            }

        }

        ControlBar {
        }

        RowLayout {
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width
            height: 48

            Button {
                text: "<"
                Layout.alignment: Qt.AlignLeft
                Layout.preferredWidth: 18
            }

            Button {
                text: ">"
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

            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "[]"
            }
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "-"
            }
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: "+"
            }
        }

    }

}
