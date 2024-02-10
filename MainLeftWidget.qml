import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts 1.15

Item {

    ColumnLayout {
        anchors.fill: parent
        ChargeWidget
        {   id: chargeStatus
            visible: left_main_source.chargeStatus
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: parent.height/1.3
        }

        SpeedWidget
        {   id: speedStatus
            visible: left_main_source.speedStatus
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: parent.height/1.3
        }

        MicroWidget
        {   id: microStatus
            visible: left_main_source.microStatus
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: parent.height/1.3
        }

        AutoResetion
        {
            id: autoResStatus
            visible: left_main_source.autoresStatus
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

                    onClicked: left_main_source.update_mainBar(1);

                }

                ToolButton {
                    id: speedButton
                    icon.source: "qrc:/ui/speed.png"
                    anchors.left: chargeButton.horizontalCenter
                    anchors.leftMargin: -parent.width * 0.3
                    anchors.verticalCenter: parent.verticalCenter
                    icon.width: parent.width * 0.35
                    icon.height: parent.height * 0.35
                    hoverEnabled: false

                    background: Rectangle {
                        color: speedButton.pressed ? "lightgray" : "transparent"
                        radius: 10
                    }

                    onClicked: left_main_source.update_mainBar(2);

                }

                ToolButton {
                    id: microButton
                    icon.source: "qrc:/ui/setting.png"
                    anchors.right: chargeButton.horizontalCenter
                    anchors.rightMargin: -parent.width * 0.3
                    anchors.verticalCenter: parent.verticalCenter
                    icon.width: parent.width * 0.35
                    icon.height: parent.height * 0.35
                    hoverEnabled: false

                    background: Rectangle {
                        color: microButton.pressed ? "lightgray" : "transparent"
                        radius: 10
                    }

                    onClicked: left_main_source.update_mainBar(3);

                }

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumHeight: parent.height/4
        }
    }
}
