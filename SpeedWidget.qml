import QtQuick
import QtQuick.Window
import my_type_speedometer 1.0

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
        anchors.leftMargin: parent.width*0.05
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
        font.pixelSize: image_distance.height * 0.5
        font.bold: true
        color: "white"
        topPadding: -parent.height * 0.03
        text: "180" + " km"
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
        source: "qrc:/ui/optics/optics_1.png"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height * 0.05
        anchors.leftMargin: parent.width * 0.2
        width: parent.width * 0.07
        height: parent.height * 0.03
    }

    Image {
        id: image_optics_2
        source: "qrc:/ui/optics/optics_2.png"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height * 0.15
        anchors.leftMargin: parent.width * 0.1
        width: parent.width * 0.07
        height: parent.height * 0.03
    }

    Image {
        id: image_optics_3
        source: "qrc:/ui/optics/optics_3.png"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height * 0.25
        anchors.leftMargin: parent.width * 0.05
        width: parent.width * 0.07
        height: parent.height * 0.03
    }

    Image {
        id: image_optics_4
        source: "qrc:/ui/optics/optics_4.png"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height * 0.35
        anchors.leftMargin: parent.width * 0.05
        width: parent.width * 0.07
        height: parent.height * 0.03
    }

    Image {
        id: image_optics_5
        source: "qrc:/ui/optics/optics_5.png"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: parent.height * 0.05
        anchors.rightMargin: parent.width * 0.2
        width: parent.width * 0.07
        height: parent.height * 0.03
    }

    Image {
        id: image_optics_6
        source: "qrc:/ui/optics/optics_6.png"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: parent.height * 0.15
        anchors.rightMargin: parent.width * 0.1
        width: parent.width * 0.07
        height: parent.height * 0.03
    }

    Image {
        id: image_optics_7
        source: "qrc:/ui/optics/optics_7.png"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: parent.height * 0.25
        anchors.rightMargin: parent.width * 0.05
        width: parent.width * 0.07
        height: parent.height * 0.03
    }

    Image {
        id: image_optics_8
        source: "qrc:/ui/optics/optics_8.png"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: parent.height * 0.35
        anchors.rightMargin: parent.width * 0.05
        width: parent.width * 0.07
        height: parent.height * 0.03
    }
}

