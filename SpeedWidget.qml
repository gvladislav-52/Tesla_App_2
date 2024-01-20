// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

//! [imports]
import QtQuick
import QtQuick.Window
//! [imports]

//! [0]
Rectangle {
    property var temp_tahometr: 1
    color: "#1f1f1f"
    //! [the dial in use]
    // Dial with a slider to adjust it
    Dial {
        id: dial
        anchors.centerIn: parent
        value: slider.x * 100 / (container.width - 32)
    }
    //! [the dial in use]

    Rectangle {
        id: container
        property int oldWidth: 0
        anchors { bottom: parent.bottom; left: parent.left
            right: parent.right; leftMargin: 20; rightMargin: 20
            bottomMargin: 10
        }
        height: 16

        radius: 8
        opacity: 0.7
        antialiasing: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "gray" }
            GradientStop { position: 1.0; color: "white" }
        }

        onWidthChanged: {
            if (oldWidth === 0) {
                oldWidth = width;
                return
            }

            let desiredPercent = slider.x * 100 / (oldWidth - 32)
            slider.x = desiredPercent * (width - 32) / 100
            oldWidth = width
        }

        Rectangle {
            id: slider
            x: 1; y: 1; width: 30; height: 14
            radius: 6
            antialiasing: true
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#424242" }
                GradientStop { position: 1.0; color: "black" }
            }

            MouseArea {
                anchors.fill: parent
                anchors.margins: -16 // Increase mouse area a lot outside the slider
                drag.target: parent; drag.axis: Drag.XAxis
                drag.minimumX: 2; drag.maximumX: container.width - 32
            }
        }
    }

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
//! [0]
