import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts 1.15

Item {
    function setWidgetVisible(value) {
        if (value === 1) {
            chargeStatus.visible = true;
            speedStatus.visible = false;
            microStatus.visible = false;
            }
         else if (value === 2) {
            chargeStatus.visible = false;
            speedStatus.visible = true;
            microStatus.visible = false;
            }
         else if (value === 3) {
            chargeStatus.visible = false;
            speedStatus.visible = false;
            microStatus.visible = true;
            }
        }

    ColumnLayout {
        anchors.fill: parent
        property int temp_button: 1
        ChargeWidget
        {   id: chargeStatus
            visible: true
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: parent.height/1.3
        }

        SpeedWidget
        {   id: speedStatus
            visible: false
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: parent.height/1.3
        }

        MicroWidget
        {   id: microStatus
            visible: false
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: parent.height/1.3
        }

        Rectangle {
            color: "white"
            width: 200
            height: 200


                ToolButton {
                    id: chargeButton
                    icon.source: "qrc:/ui/charge.png"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    icon.width: parent.width * 0.35 // Масштабирование ширины иконки
                    icon.height: parent.height * 0.35 // Масштабирование высоты иконки
                    hoverEnabled: false

                    background: Rectangle {
                        color: chargeButton.pressed ? "lightgray" : "transparent"
                        radius: 10
                    }

                    onClicked: setWidgetVisible(1)

                }

                ToolButton {
                    id: speedButton
                    icon.source: "qrc:/ui/speed.png"
                    anchors.left: chargeButton.horizontalCenter
                    anchors.leftMargin: -parent.width * 0.3
                    anchors.verticalCenter: parent.verticalCenter
                    icon.width: parent.width * 0.35 // Масштабирование ширины иконки
                    icon.height: parent.height * 0.35 // Масштабирование высоты иконки
                    hoverEnabled: false

                    background: Rectangle {
                        color: speedButton.pressed ? "lightgray" : "transparent"
                        radius: 10
                    }

                    onClicked: setWidgetVisible(2)

                }

                ToolButton {
                    id: microButton
                    icon.source: "qrc:/ui/setting.png"
                    anchors.right: chargeButton.horizontalCenter
                    anchors.rightMargin: -parent.width * 0.3
                    anchors.verticalCenter: parent.verticalCenter
                    icon.width: parent.width * 0.35 // Масштабирование ширины иконки
                    icon.height: parent.height * 0.35 // Масштабирование высоты иконки
                    hoverEnabled: false

                    background: Rectangle {
                        color: microButton.pressed ? "lightgray" : "transparent"
                        radius: 10
                    }

                    onClicked: setWidgetVisible(3)

                }

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: parent.height/4
        }
    }
}
