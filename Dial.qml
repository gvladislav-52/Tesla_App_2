// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause
import com.ulasdikme.speedometer 1.0
import QtQuick

Item {
    id: root
    property real value : 0

    width: 210; height: 210

    Image {
        id: back_image
        source: "qrc:/ui/background1.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: -30
    }

    Speedometer
    {
        objectName: "speedoMeter"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: -61
        width: 258
        height: 253
        startAngle: 275
        alignAngle: 40
        lowestRange: 0
        highestRange: 4000
        speed: 1230
        arcWidth: 10
        outerColor: outerColor
        textColor: "#09e8e5"
    }


//! [needle]
    Image {
        id: needle
        x: 95; y:-103
        height: 30
        antialiasing: true
        source: "qrc:/ui/needle_shadow.png"
        transform: Rotation {
            id: needleRotation
            origin.x: 10; origin.y: 143
            angle: Math.min(Math.max(-140, root.value * 3 - 140), 146)
        }
    }

    // Text {
    //     id: text_speed
    //     anchors.verticalCenter: back_image.verticalCenter
    //     anchors.horizontalCenter: back_image.horizontalCenter
    //     //horizontalAlignment: Text.AlignHCenter
    //     text: Math.round((root.value*2.5)+3)
    //     font.pixelSize: 50
    //     font.bold: true
    //     color: "#09e8e5"
    //     topPadding: -50
    // }

    // Text {
    //     id: text_mph
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     anchors.top: text_speed.bottom
    //     text: "MPH"
    //     font.pixelSize: 30
    //     font.bold: true
    //     color: "#09e8e5"
    // }

    // Text {
    //     id: text_tahometr
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     anchors.top: text_mph.bottom
    //     font.pixelSize: 20
    //     font.bold: true
    //     color: "#09e8e5"
    //     text: {
    //         var speed = parseInt(text_speed.text);
    //         var speedLimits = [
    //             {limit: 210, value: "6"},
    //             {limit: 150, value: "5"},
    //             {limit: 110, value: "4"},
    //             {limit: 70, value: "3"},
    //             {limit: 30, value: "2"},
    //             {limit: 0, value: "1"}
    //         ];
    //         for (var i = 0; i < speedLimits.length; i++) {
    //             if (speed > speedLimits[i].limit) {
    //                 return speedLimits[i].value;
    //             }
    //         }
    //         return "N";
    //     }
    // }

    Image {
        id: car_copy
        source: "qrc:/ui/tesla_copy.png"
        anchors.horizontalCenter: text_speed.horizontalCenter
        anchors.top: back_image.bottom
    }

//! [needle]
//! [overlay]
    //Image { x: 31; y: 33; source: "qrc:/ui/overlay.png" }
//! [overlay]
}
