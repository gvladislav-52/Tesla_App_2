import QtQuick
import QtQuick.Window
import my_type_speedometer 1.0
import QtQuick.Controls

Rectangle {
    color: "#1f1f1f"

    //[SPEEDOMETER]
    Image {
        id: back_image
        source: "qrc:/ui/background1.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: -30
    }

    Speedometer
    {
        id: speedometer_name
        objectName: "speedometer_object_qml"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: -61
        width: 258
        height: 253
        startAngle: 275
        alignAngle: 40
        lowestRange: 0
        highestRange: 4000
        arcWidth: 10
        outerColor: outerColor
    }

    Text {
        id: text_speed
        anchors.verticalCenter: back_image.verticalCenter
        anchors.horizontalCenter: back_image.horizontalCenter
        text: parseInt(speedometer_name.speed/17.8)
        font.pixelSize: 50
        font.bold: true
        color: "#09e8e5"
        topPadding: -50
    }

    Text {
        id: text_mph
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: text_speed.bottom
        text: "MPH"
        font.pixelSize: 30
        font.bold: true
        color: "#09e8e5"
    }

    Text {
        id: text_tahometr
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: text_mph.bottom
        font.pixelSize: 20
        font.bold: true
        color: "#09e8e5"
        text: speedometer_name.textSelector
    }
    //[~SPEEDOMETER]

    Image {
        id: car_copy
        source: "qrc:/ui/tesla_copy.png"
        anchors.horizontalCenter: back_image.horizontalCenter
        anchors.top: back_image.bottom
    }


    //[DISTANCE]
    Image {
        id: image_distance
        source: "qrc:/ui/distance.png"
        anchors.left: parent.left
        anchors.leftMargin: parent.width*0.04
        anchors.top: parent.verticalCenter
        anchors.topMargin: parent.height *0.12
        width: parent.width*0.08
        height: parent.height*0.05
    }

    Text {
        id: text_distance
        anchors.left: image_distance.left
        anchors.leftMargin: parent.width * 0.1
        anchors.verticalCenter: image_distance.verticalCenter
        font.pixelSize: image_distance.height * 0.4
        font.bold: true
        color: "white"
        topPadding: -parent.height * 0.03
        text: speedometer_name.textDistance + " mph"
    }

    Text {
        id: text_distance_static
        anchors.left: image_distance.left
        anchors.leftMargin: parent.width*0.1
        anchors.top: text_distance.bottom
        text: "Distance"
        font.pixelSize: image_distance.height*0.35
        font.bold: true
        color: "white"
    }
    //[~DISTANCE]

    Image {
        id: image_optics
        source: indicator_temp_qml.indicator_path[0]
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height * 0.05
        anchors.leftMargin: parent.width * 0.25
        height: parent.height * 0.075
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image_optics_2
        source: indicator_temp_qml.indicator_path[1]
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height * 0.125
        anchors.leftMargin: parent.width * 0.125
        height: parent.height * 0.075
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image_optics_3
        source: indicator_temp_qml.indicator_path[2]
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height * 0.25
        anchors.leftMargin: parent.width * 0.05
        height: parent.height * 0.075
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image_optics_4
        source: indicator_temp_qml.indicator_path[3]
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height * 0.35
        anchors.leftMargin: parent.width * 0.05
        height: parent.height * 0.075
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image_optics_5
        source: indicator_temp_qml.indicator_path[4]
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: parent.height * 0.05
        anchors.rightMargin: parent.width * 0.25
        height: parent.height * 0.075
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image_optics_6
        source: indicator_temp_qml.indicator_path[5]
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: parent.height * 0.125
        anchors.rightMargin: parent.width * 0.125
        height: parent.height * 0.075
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image_optics_7
        source: indicator_temp_qml.indicator_path[6]
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: parent.height * 0.25
        anchors.rightMargin: parent.width * 0.05
        height: parent.height * 0.075
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image_optics_8
        source: indicator_temp_qml.indicator_path[7]
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: parent.height * 0.35
        anchors.rightMargin: parent.width * 0.05
        height: parent.height * 0.075
        fillMode: Image.PreserveAspectFit
    }
}

