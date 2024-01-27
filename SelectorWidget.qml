import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts 1.15

Rectangle {
    id: selectButtonFooter
    anchors.bottom: parent.bottom
    color: "black"

    ToolButton {
        id: ventButton
        icon.source: footer_temp_qml.bool_temp_button[4] ? "qrc:/ui/button_footer/Vint_r.png" : "qrc:/ui/button_footer/Vint.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.horizontalCenter: selectButtonFooter.horizontalCenter
        icon.width: selectButtonFooter.width * 0.5 // Масштабирование ширины иконки
        icon.height: selectButtonFooter.height * 0.5 // Масштабирование высоты иконки
        hoverEnabled: false

        background: Rectangle {
            color: "transparent"
        }

        property bool temp_ventButton: false

        Behavior on rotation {
            RotationAnimation {
                duration: 1000 // Время одного оборота в мс
            }
        }

            onClicked: {
                ventButton.rotation = 0
                ventButton.temp_ventButton = !ventButton.temp_ventButton
                footer_temp_qml.bool_temp_button[4] = !footer_temp_qml.bool_temp_button[4]
            }

        onTemp_ventButtonChanged: {
            if (ventButton.temp_ventButton) {
                ventButton.rotation = 360
            } else {
                ventButton.rotation = 0
            }
        }
    }

    ColumnLayout {
        id: columnTempLeft
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.left: ventButton.left
        anchors.leftMargin: -parent.width * 0.09

        ToolButton {
            id: upButtonLeft
            icon.source: "qrc:/ui/button_footer/UP.png"
            implicitWidth: textTempLeft.width
            Layout.preferredHeight: selectButtonFooter.height * 0.2
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            hoverEnabled: false

            background: Rectangle {
                color: upButtonLeft.pressed ? "lightgray" : "transparent"
                radius: 10
            }
            onClicked: footer_temp_qml.setLeft_SlotPlus()
        }

        Text {
            id: textTempLeft
            text: footer_temp_qml.leftTemperature + "°"
            color: if (footer_temp_qml.leftTemperature === 29) "red"
            else if (footer_temp_qml.leftTemperature === 15) "#45FFFF"
            else "white"
            font.bold: true
            font.pixelSize: Math.min(selectButtonFooter.width, selectButtonFooter.height) * 0.25
        }

        ToolButton {
            id: downButtonLeft
            icon.source: "qrc:/ui/button_footer/DOWN.png"
            implicitWidth: textTempLeft.width
            Layout.preferredHeight: selectButtonFooter.height * 0.2
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
            hoverEnabled: false

            background: Rectangle {
                color: downButtonLeft.pressed ? "lightgray" : "transparent"
                radius: 10
            }
            onClicked: footer_temp_qml.setLeft_SlotMinus()
        }
    }

    ColumnLayout {
        id: columnTempRight
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.right: ventButton.right
        anchors.rightMargin: -parent.width * 0.09

        ToolButton {
            id: upButtonRight
            icon.source: "qrc:/ui/button_footer/UP.png"
            implicitWidth: textTempRight.width
            Layout.preferredHeight: selectButtonFooter.height * 0.2
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            hoverEnabled: false

            background: Rectangle {
                color: upButtonRight.pressed ? "lightgray" : "transparent"
                radius: 10
            }
            onClicked: footer_temp_qml.setRight_SlotPlus()
        }

        Text {
            id: textTempRight
            text: footer_temp_qml.rightTemperature + "°"
            color: if (footer_temp_qml.rightTemperature === 29) "red"
                    else if (footer_temp_qml.rightTemperature === 15) "#45FFFF"
                    else "white"
            font.bold: true
            font.pixelSize: Math.min(selectButtonFooter.width, selectButtonFooter.height) * 0.25
        }

        ToolButton {
            id: downButtonRight
            icon.source: "qrc:/ui/button_footer/DOWN.png"
            implicitWidth: textTempRight.width
            Layout.preferredHeight: selectButtonFooter.height * 0.2
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
            hoverEnabled: false

            background: Rectangle {
                color: downButtonRight.pressed ? "lightgray" : "transparent"
                radius: 10
            }
            onClicked: footer_temp_qml.setRight_SlotMinus()
        }
    }

    ToolButton {
        id: seatButtonLeft
        icon.source: if(temp_seatButtonLeft === 0)
                         "qrc:/ui/button_footer/seatRight.png"
                    else if (temp_seatButtonLeft === 1)
                         "qrc:/ui/button_footer/seatRightRedBottom.png"
                    else if (temp_seatButtonLeft === 2)
                         "qrc:/ui/button_footer/seatRightRedMiddle.png"
                    else "qrc:/ui/button_footer/seatRightRedTop.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.left: columnTempLeft.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        property int temp_seatButtonLeft: 0

        background: Rectangle {
            color: "transparent"
        }

        onClicked: {if(temp_seatButtonLeft < 3)
                       temp_seatButtonLeft++;
                    else temp_seatButtonLeft = 0
            footer_temp_qml.bool_temp_button[3] = !footer_temp_qml.bool_temp_button[3]
        }

        transform: Scale {
            xScale: -1
            origin.x: seatButtonLeft.width / 2
            origin.y: seatButtonLeft.height / 2
        }
    }

    ToolButton {
        id: seatButtonRight
        icon.source: if(temp_seatButtonRight === 0)
                         "qrc:/ui/button_footer/seatRight.png"
                    else if (temp_seatButtonRight === 1)
                         "qrc:/ui/button_footer/seatRightRedBottom.png"
                    else if (temp_seatButtonRight === 2)
                         "qrc:/ui/button_footer/seatRightRedMiddle.png"
                    else "qrc:/ui/button_footer/seatRightRedTop.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.right: columnTempRight.right
        anchors.rightMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        property int temp_seatButtonRight: 0

        background: Rectangle {
            color: "transparent"
        }

        onClicked: {if(temp_seatButtonRight < 3)
                       temp_seatButtonRight++;
                    else temp_seatButtonRight = 0
            footer_temp_qml.bool_temp_button[5] = !footer_temp_qml.bool_temp_button[5]
        }
    }

    ToolButton {
        id: heaperButtonBack
        icon.source: footer_temp_qml.bool_temp_button[2] ? "qrc:/ui/button_footer/heaperback_r.png" : "qrc:/ui/button_footer/heaperback.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.left: seatButtonLeft.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: "transparent"
            radius: 10
        }

        onClicked: footer_temp_qml.bool_temp_button[2] = !footer_temp_qml.bool_temp_button[2]
    }

    ToolButton {
        id: heaperButtonFront
        icon.source: footer_temp_qml.bool_temp_button[1] ? "qrc:/ui/button_footer/heaperfront_r.png" : "qrc:/ui/button_footer/heaperfront.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.left: heaperButtonBack.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: "transparent"
            radius: 10
        }

        onClicked: footer_temp_qml.bool_temp_button[1] = !footer_temp_qml.bool_temp_button[1]
    }

    ToolButton {
        id: carButton
        icon.source: footer_temp_qml.bool_temp_button[0] ? "qrc:/ui/button_footer/carIcon_r.png" : "qrc:/ui/button_footer/carIcon.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.left: heaperButtonFront.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: "transparent"
            radius: 10
        }

        onClicked: footer_temp_qml.bool_temp_button[0] = !footer_temp_qml.bool_temp_button[0]
    }

    ToolButton {
        id: musicButton
        icon.source: footer_temp_qml.bool_temp_button[6] ? "qrc:/ui/button_footer/music_r.png" : "qrc:/ui/button_footer/music.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.right: seatButtonRight.right
        anchors.rightMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: "transparent"
            radius: 10
        }

         onClicked: footer_temp_qml.bool_temp_button[6] = !footer_temp_qml.bool_temp_button[6]
    }

    ToolButton {
        id: phoneButton
        icon.source: footer_temp_qml.bool_temp_button[7] ? "qrc:/ui/button_footer/phone_r.png" : "qrc:/ui/button_footer/phone.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.right: musicButton.right
        anchors.rightMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: "transparent"
            radius: 10
        }

         onClicked: footer_temp_qml.bool_temp_button[7] = !footer_temp_qml.bool_temp_button[7]

    }

    ColumnLayout {
        id: columnSound
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.right: phoneButton.right
        anchors.rightMargin: -parent.width * 0.08

        ToolButton {
            id: upButtonSound
            icon.source: "qrc:/ui/button_footer/UP.png"
            implicitWidth: soundButton.width
            Layout.preferredHeight: selectButtonFooter.height * 0.2
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            hoverEnabled: false

            background: Rectangle {
                color: "transparent"
                radius: 10
            }

            onClicked: footer_temp_qml.setSound_SlotPlus()
        }

        ToolButton {
            id: soundButton
            icon.source: "qrc:/ui/button_footer/sound.png"
            anchors.verticalCenter: selectButtonFooter.verticalCenter
            icon.width: selectButtonFooter.width * 0.25
            icon.height: selectButtonFooter.height * 0.25
            hoverEnabled: false

            background: Rectangle {
                color: "transparent"
                radius: 10
            }
        }

        ToolButton {
            id: downButtonSound
            icon.source: "qrc:/ui/button_footer/DOWN.png"
            implicitWidth: soundButton.width
            Layout.preferredHeight: selectButtonFooter.height * 0.2
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
            hoverEnabled: false

            background: Rectangle {
                color: "transparent"
                radius: 10
            }
            onClicked: footer_temp_qml.setSound_SlotMinus()
        }
    }
}
