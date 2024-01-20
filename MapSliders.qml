// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls

Row {
    id: containerRow

    property var mapSource
    property real fontSize : 14
    property color labelBackground : "transparent"
    property int edge: Qt.RightEdge
    property alias expanded: sliderToggler.checked

    function rightEdge() {
        return (containerRow.edge === Qt.RightEdge);
    }

    layoutDirection: rightEdge() ? Qt.LeftToRight : Qt.RightToLeft
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.rightMargin: parent.width/100
    anchors.right: rightEdge() ? parent.right : undefined
    anchors.left: rightEdge() ? undefined : parent.left

    ToolButton {
        id: sliderToggler
        contentItem: Image {
            source: "qrc:/ui/menu.png"
            fillMode: Image.PreserveAspectFit
        }
        width: containerRow.height/15
        height: containerRow.height/15
        checkable: true
        anchors.top: parent.verticalCenter
        anchors.topMargin: -parent.height *0.45

        background: Rectangle {
                color: "transparent"
                border.color: sliderToggler.checked ? "black" : "transparent"
                border.width: 4
                radius: 10
        }
    }

    Rectangle {
        id: sliderContainer
        height: parent.height/2
        width: sliderRow.width*1.5
        visible: sliderToggler.checked
        color: "white"//Qt.rgba( 0, 191 / 255.0, 255 / 255.0, 0.07)
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: -parent.height *0.05
        radius: 10
        border.color: "lightgray"
        border.width: 4
        //property var labelBorderColor: "red"
        property var slidersHeight : sliderContainer.height

        FontLoader {
            id: palaceScriptFont
            source: "qrc:/ui/font.ttf"
        }

        Text {
            id: textSetting
            text: "Setting"
            font.pixelSize: sliderContainer.width * 0.12
            color: "black"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.04
            font.bold: true
            font.family: palaceScriptFont.name
        }

            Row {
                id: sliderRow
                height: sliderContainer.slidersHeight-40
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: textSetting.top
                anchors.topMargin: textSetting.height
                spacing: parent.width/5

                Slider {
                    id: zoomSlider
                    orientation: Qt.Vertical // Устанавливаем вертикальную ориентацию
                    value : containerRow.mapSource.zoomLevel
                    from : containerRow.mapSource.minimumZoomLevel
                    to : containerRow.mapSource.maximumZoomLevel
                    // Остальные свойства слайдера остаются без изменений

                    background: Rectangle {
                        anchors.horizontalCenter: circleSlide_zoomSlider.horizontalCenter
                        implicitHeight: sliderRow.height // Изменяем высоту фона ориентируясь на вашу задачу
                        height: implicitHeight
                        width: 4
                        radius: 2
                        color: "black"

                        Rectangle {
                            width: 4
                            height: zoomSlider.visualPosition * parent.height
                            color: "lightgray"
                            radius: 2
                        }
                    }

                    handle: Rectangle {
                        id: circleSlide_zoomSlider
                        x: zoomSlider.leftPadding + zoomSlider.availableWidth / 2 - width / 2
                        y: zoomSlider.topPadding + zoomSlider.visualPosition * (zoomSlider.availableHeight - height)
                        implicitWidth: 26
                        implicitHeight: 26
                        radius: 13
                        color: zoomSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                        border.color: "#bdbebf"
                        Rectangle
                        {
                            id: textRectangle_zoomSlider
                            width: 25
                            height: 25
                            color: "lightgray"
                            anchors.right: circleSlide_zoomSlider.left
                            anchors.rightMargin:  10
                            radius: 4
                            border.color:  "black"
                            border.width: 2
                            Text
                            {
                                anchors.horizontalCenter: textRectangle_zoomSlider.horizontalCenter
                                anchors.verticalCenter: textRectangle_zoomSlider.verticalCenter
                                text: Math.round(zoomSlider.value)
                                font.pixelSize: 12
                                color: "black"
                            }
                        }
                    }

                    onValueChanged: {
                        containerRow.mapSource.zoomLevel = value
                    }

                    Text {
                        anchors.top: zoomSlider.bottom
                        text: "Zoom"
                        font.pixelSize: sliderContainer.width * 0.06
                        color: "black"
                        horizontalAlignment: Text.AlignHCenter
                        anchors.horizontalCenter: zoomSlider.horizontalCenter
                        font.bold: true
                    }
                }

                // Slider {
                //     id: bearingSlider
                //     height: parent.height
                //     from: 0
                //     to: 360
                //     orientation : Qt.Vertical
                //     value: containerRow.mapSource.bearing
                //     onValueChanged: {
                //         containerRow.mapSource.bearing = value;
                //     }
                // }

                Slider {
                    id: bearingSlider
                    orientation: Qt.Vertical // Устанавливаем вертикальную ориентацию
                    value: containerRow.mapSource.bearing
                    from: 0
                    to: 360

                    // Остальные свойства слайдера остаются без изменений

                    background: Rectangle {
                        anchors.horizontalCenter: circleSlide_bearingSlider.horizontalCenter
                        implicitHeight: sliderRow.height // Изменяем высоту фона ориентируясь на вашу задачу
                        height: implicitHeight
                        width: 4
                        radius: 2
                        color: "black"

                        Rectangle {
                            width: 4
                            height: bearingSlider.visualPosition * parent.height
                            color: "lightgray"
                            radius: 2
                        }
                    }

                    handle: Rectangle {
                        id: circleSlide_bearingSlider
                        x: bearingSlider.leftPadding + bearingSlider.availableWidth / 2 - width / 2
                        y: bearingSlider.topPadding + bearingSlider.visualPosition * (bearingSlider.availableHeight - height)
                        implicitWidth: 26
                        implicitHeight: 26
                        radius: 13
                        color: bearingSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                        border.color: "#bdbebf"

                        Rectangle
                        {
                            id: textRectangle_bearingSlider
                            width: 25
                            height: 25
                            color: "lightgray"
                            anchors.right: circleSlide_bearingSlider.left
                            anchors.rightMargin:  10
                            radius: 4
                            border.color:  "black"
                            border.width: 2
                            Text
                            {
                                anchors.horizontalCenter: textRectangle_bearingSlider.horizontalCenter
                                anchors.verticalCenter: textRectangle_bearingSlider.verticalCenter
                                text: Math.round(bearingSlider.value/18)
                                font.pixelSize: 12
                                color: "black"
                            }
                        }
                    }

                    onValueChanged: {
                        containerRow.mapSource.bearing = value;
                    }

                    Text {
                        anchors.top: bearingSlider.bottom
                        text: "Rotate"
                        font.pixelSize: sliderContainer.width * 0.06
                        color: "black"
                        horizontalAlignment: Text.AlignHCenter
                        anchors.horizontalCenter: bearingSlider.horizontalCenter
                        font.bold: true
                    }
                }

                Slider {
                    id: tiltSlider
                    orientation: Qt.Vertical // Устанавливаем вертикальную ориентацию
                    from: containerRow.mapSource.minimumTilt;
                    to: containerRow.mapSource.maximumTilt
                    value: containerRow.mapSource.tilt

                    // Остальные свойства слайдера остаются без изменений

                    background: Rectangle {
                        anchors.horizontalCenter: circleSlide_tiltSlider.horizontalCenter
                        implicitHeight: sliderRow.height // Изменяем высоту фона ориентируясь на вашу задачу
                        height: implicitHeight
                        width: 4
                        radius: 2
                        color: "black"

                        Rectangle {
                            width: 4
                            height: tiltSlider.visualPosition * parent.height
                            color: "lightgray"
                            radius: 2
                        }
                    }

                    handle: Rectangle {
                        id: circleSlide_tiltSlider
                        x: tiltSlider.leftPadding + tiltSlider.availableWidth / 2 - width / 2
                        y: tiltSlider.topPadding + tiltSlider.visualPosition * (tiltSlider.availableHeight - height)
                        implicitWidth: 26
                        implicitHeight: 26
                        radius: 13
                        color: tiltSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                        border.color: "#bdbebf"

                        Rectangle
                        {
                            id: textRectangle_tiltSlider
                            width: 25
                            height: 25
                            color: "lightgray"
                            anchors.right: circleSlide_tiltSlider.left
                            anchors.rightMargin:  10
                            radius: 4
                            border.color:  "black"
                            border.width: 2
                            Text
                            {
                                anchors.horizontalCenter: textRectangle_tiltSlider.horizontalCenter
                                anchors.verticalCenter: textRectangle_tiltSlider.verticalCenter
                                text: Math.round(tiltSlider.value/4)
                                font.pixelSize: 12
                                color: "black"
                            }
                        }
                    }

                    onValueChanged: {
                        containerRow.mapSource.tilt = value;
                    }

                    Text {
                        anchors.top: tiltSlider.bottom
                        //anchors.topMargin: 5
                        text: "Angle"
                        font.pixelSize: sliderContainer.width * 0.06
                        color: "black"
                        horizontalAlignment: Text.AlignHCenter
                        anchors.horizontalCenter: tiltSlider.horizontalCenter
                        font.bold: true
                    }
                }
        } // Column
    } // sliderContainer
} // containerRow
