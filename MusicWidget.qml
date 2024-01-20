import QtQuick 2.0

Item {
    visible: true
    anchors.fill: parent
    Rectangle {
        radius: 10
        anchors.bottom: parent.bottom
        width: parent.width
        //anchors.bottomMargin: 5
        height: 0.2*parent.height
        color: "lightgray"
        opacity: 0.95
    }
}
