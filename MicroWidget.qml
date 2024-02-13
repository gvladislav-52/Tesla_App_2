import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia


Rectangle {
    id : cameraUI

    anchors.fill: parent
    color: "black"
    state: "VideoCapture"
    states: [
        State {
            name: "VideoCapture"
            StateChangeScript {
                script: {
                    camera.start()
                }
            }
        }
    ]

    CaptureSession {
        id: captureSession
        camera: Camera {
            id: camera
        }
        videoOutput: viewfinder
    }

    // Item {
    //     id: cameraNotDetectedImage
    //     visible: captureSession.camera.status === CaptureSession.UnavailableStatus
    //     width: parent.width * 0.97
    //     height: parent.height * 0.5
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     anchors.top: parent.top

    //     Image {
    //         source: "qrc:/ui/button_footer/refresh.png" // Укажите путь к вашему изображению
    //         anchors.fill: parent
    //         fillMode: Image.PreserveAspectFit
    //     }
    // }

    VideoOutput {
        id: viewfinder
        visible: true
        width: parent.width * 0.97
        height: parent.height * 0.5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top

        Image
        {
            width: parent.width * 0.9
            height: parent.height * 0.3
            source: "qrc:/ui/traectoria.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.1
        }
    }

    ToolButton {
        id: button_restart_camera
        icon.source:  "qrc:/ui/button_footer/refresh.png"
        anchors.top: viewfinder.bottom
        anchors.topMargin: parent.height*0.02
        anchors.horizontalCenter: parent.horizontalCenter
        icon.width: cameraUI.width * 0.2
        icon.height: cameraUI.height * 0.2
        hoverEnabled: false

        background: Rectangle {
            color: "transparent"
        }
        onClicked:
        {
            camera.stop()
            camera.start()
        }
    }
}
