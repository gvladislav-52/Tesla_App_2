import QtQuick
import QtPositioning
import QtLocation
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: selector
    width: parent.width*0.06
    height: parent.height*0.4
    color: "black"
    anchors.top: parent.top
    anchors.left: parent.left

    ColumnLayout
    {
        id: column_id
        anchors.fill: parent
        Repeater {
            model: 5
            ToolButton {
                id: pbutton
                anchors.horizontalCenter: column_id.horizontalCenter
                Layout.preferredWidth: column_id.width*0.8
                Layout.preferredHeight: column_id.height*0.15
                contentItem:
                    Rectangle {
                        anchors.fill: parent
                        color: "transparent"
                        border.color: lightsourcefile_temp_qml.selectorSource.name_selectorSource[index]? "green" : "transparent"
                        border.width: 3
                        radius: 5
                        Image {
                            anchors.fill: parent
                            source: lightsourcefile_temp_qml.selectorSource.path_selectorSource[index]
                            fillMode: Image.PreserveAspectFit
                        }
                    }
                hoverEnabled: false
                onClicked: lightsourcefile_temp_qml.selectorSource.update_select(index)
            }
        }
    }
}
