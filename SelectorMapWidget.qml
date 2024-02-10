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

    ColumnLayout {
        id: column_id
        anchors.fill: parent

        Repeater {
            model: 5
            delegate: ToolButton {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: column_id.width * 0.8
                Layout.preferredHeight: column_id.height * 0.15
                contentItem: Rectangle {
                    anchors.fill: parent
                    color: "transparent"
                    border.color: left_main_source.name_selectorSource[index] ? "green" : "transparent"
                    border.width: 3
                    radius: 5
                    Image {
                        anchors.fill: parent
                        source: left_main_source.path_selectorSource[index]
                        fillMode: Image.PreserveAspectFit
                    }
                }
                hoverEnabled: false
                onClicked: left_main_source.update_selector(index)
            }
        }
    }
}
