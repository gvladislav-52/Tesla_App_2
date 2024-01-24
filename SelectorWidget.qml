import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts 1.15

Rectangle {
    id: selectButtonFooter
    anchors.bottom: parent.bottom
    color: "black"

    ToolButton {
        id: ventButton
        icon.source: !ventButton.temp_ventButton ? "qrc:/ui/Vint.png" : "qrc:/ui/VintRed.png"
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
            icon.source: "qrc:/ui/UP.png"
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
            text: footer_temp_qml.left_Temparate + "°"
            color: if (footer_temp_qml.left_Temparate === 29) "red"
            else if (footer_temp_qml.left_Temparate === 15) "#45FFFF"
            else "white"
            font.bold: true
            font.pixelSize: Math.min(selectButtonFooter.width, selectButtonFooter.height) * 0.25
        }

        ToolButton {
            id: downButtonLeft
            icon.source: "qrc:/ui/DOWN.png"
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
            icon.source: "qrc:/ui/UP.png"
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
            text: footer_temp_qml.right_Temparate + "°"
            color: if (footer_temp_qml.right_Temparate === 29) "red"
                    else if (footer_temp_qml.right_Temparate === 15) "#45FFFF"
                    else "white"
            font.bold: true
            font.pixelSize: Math.min(selectButtonFooter.width, selectButtonFooter.height) * 0.25
        }

        ToolButton {
            id: downButtonRight
            icon.source: "qrc:/ui/DOWN.png"
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
                         "qrc:/ui/seatRight.png"
                    else if (temp_seatButtonLeft === 1)
                         "qrc:/ui/seatRightRedBottom.png"
                    else if (temp_seatButtonLeft === 2)
                         "qrc:/ui/seatRightRedMiddle.png"
                    else "qrc:/ui/seatRightRedTop.png"
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

        onClicked: if(temp_seatButtonLeft < 3)
                       temp_seatButtonLeft++;
                    else temp_seatButtonLeft = 0

        transform: Scale {
            xScale: -1
            origin.x: seatButtonLeft.width / 2
            origin.y: seatButtonLeft.height / 2
        }
    }

    ToolButton {
        id: seatButtonRight
        icon.source: if(temp_seatButtonRight === 0)
                         "qrc:/ui/seatRight.png"
                    else if (temp_seatButtonRight === 1)
                         "qrc:/ui/seatRightRedBottom.png"
                    else if (temp_seatButtonRight === 2)
                         "qrc:/ui/seatRightRedMiddle.png"
                    else "qrc:/ui/seatRightRedTop.png"
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

        onClicked: if(temp_seatButtonRight < 3)
                       temp_seatButtonRight++;
                    else temp_seatButtonRight = 0
    }

    ToolButton {
        id: heaperButtonBack
        icon.source: "qrc:/ui/heaperback.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.left: seatButtonLeft.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: heaperButtonBack.pressed ? "lightgray" : "transparent"
            radius: 10
        }
    }

    ToolButton {
        id: heaperButtonFront
        icon.source: "qrc:/ui/heaperfront.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.left: heaperButtonBack.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: heaperButtonFront.pressed ? "lightgray" : "transparent"
            radius: 10
        }
    }

    ToolButton {
        id: carButton
        icon.source: "qrc:/ui/carIcon.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.left: heaperButtonFront.left
        anchors.leftMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: carButton.pressed ? "lightgray" : "transparent"
            radius: 10
        }

        onClicked: settting_style.visible = !settting_style.visible
    }

    SettingApplicationWidget {id: settting_style
        visible: false}

    ToolButton {
        id: musicButton
        icon.source: "qrc:/ui/music.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.right: seatButtonRight.right
        anchors.rightMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: musicButton.pressed ? "lightgray" : "transparent"
            radius: 10
        }
    }

    ToolButton {
        id: phoneButton
        icon.source: "qrc:/ui/phone.png"
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.right: musicButton.right
        anchors.rightMargin: -parent.width * 0.09
        icon.width: selectButtonFooter.width * 0.5
        icon.height: selectButtonFooter.height * 0.5
        hoverEnabled: false

        background: Rectangle {
            color: phoneButton.pressed ? "lightgray" : "transparent"
            radius: 10
        }

    }

    ColumnLayout {
        id: columnSound
        anchors.verticalCenter: selectButtonFooter.verticalCenter
        anchors.right: phoneButton.right
        anchors.rightMargin: -parent.width * 0.08

        ToolButton {
            id: upButtonSound
            icon.source: "qrc:/ui/UP.png"
            implicitWidth: soundButton.width
            Layout.preferredHeight: selectButtonFooter.height * 0.2
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            hoverEnabled: false

            background: Rectangle {
                color: upButtonSound.pressed ? "lightgray" : "transparent"
                radius: 10
            }

            onClicked: footer_temp_qml.setSound_SlotPlus()
        }

        ToolButton {
            id: soundButton
            icon.source: "qrc:/ui/sound.png"
            anchors.verticalCenter: selectButtonFooter.verticalCenter
            icon.width: selectButtonFooter.width * 0.25
            icon.height: selectButtonFooter.height * 0.25
            hoverEnabled: false

            background: Rectangle {
                color: soundButton.pressed ? "lightgray" : "transparent"
                radius: 10
            }
        }

        ToolButton {
            id: downButtonSound
            icon.source: "qrc:/ui/DOWN.png"
            implicitWidth: soundButton.width
            Layout.preferredHeight: selectButtonFooter.height * 0.2
            Layout.alignment: Qt.AlignBottom | Qt.AlignHCenter
            hoverEnabled: false

            background: Rectangle {
                color: downButtonSound.pressed ? "lightgray" : "transparent"
                radius: 10
            }
            onClicked: footer_temp_qml.setSound_SlotMinus()
        }
    }
}
