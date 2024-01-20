import QtQuick
import QtPositioning
import QtLocation
import QtQuick.Controls

Rectangle {
    id: selector
    width: parent.width*0.06
    height: parent.height*0.4
    color: "black"
    anchors.top: parent.top
    anchors.left: parent.left

    ToolButton {
        id: pbutton
        anchors.horizontalCenter: selector.horizontalCenter
        width: selector.width*0.9
        height: selector.height*0.2
        contentItem: Image {
            source: "qrc:/ui/P.png"
            fillMode: Image.PreserveAspectFit
        }
        hoverEnabled: false
    }
    ToolButton {
        id: rbutton
        anchors.top: pbutton.bottom
        anchors.horizontalCenter: selector.horizontalCenter
        width: selector.width*0.9
        height: selector.height*0.2
        contentItem: Image {
            source: "qrc:/ui/R.png"
            fillMode: Image.PreserveAspectFit
        }
        hoverEnabled: false
    }

    ToolButton {
        id: nbutton
        anchors.top: rbutton.bottom
        anchors.horizontalCenter: selector.horizontalCenter
        width: selector.width*0.9
        height: selector.height*0.2
        contentItem: Image {
            source: "qrc:/ui/N.png"
            fillMode: Image.PreserveAspectFit
        }
        hoverEnabled: false
    }

    ToolButton {
    id: sbutton
    anchors.top: nbutton.bottom
    anchors.horizontalCenter: selector.horizontalCenter
    width: selector.width*0.9
    height: selector.height*0.2
    contentItem: Image {
        source: "qrc:/ui/S.png"
        fillMode: Image.PreserveAspectFit
        }
        hoverEnabled: false
    }

    ToolButton {
        id: dbutton
        anchors.top: sbutton.bottom
        anchors.horizontalCenter: selector.horizontalCenter
        width: selector.width*0.9
        height: selector.height*0.2
        contentItem: Image {
            source: "qrc:/ui/D.png"
            fillMode: Image.PreserveAspectFit
        }
        hoverEnabled: false
    }
}
