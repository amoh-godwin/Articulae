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

    }

}
