import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts


    ApplicationWindow {
        id: micro_rectangle
        color: "#1f1f1f"
        height: 500
        width: 400

        FontLoader {
            id: palaceScriptFont
            source: "qrc:/ui/font.ttf"
        }

        Text {
            id: textSetting
            text: "Setting"
            font.pixelSize: parent.height*0.1
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            font.family: palaceScriptFont.name
        }

            ScrollView
            {
                anchors.top: textSetting.bottom
                width: parent.width
                height: parent.height-textSetting.height
                clip: true
                ScrollBar.vertical.policy: ScrollBar.AlwaysOff
                contentHeight: parent.height * 1.3
            ColumnLayout
                    {
                        id: column_Id
                        anchors.fill: parent

                        Repeater {
                            model: 10

                            RowLayout {
                                id: row_layout
                                Layout.preferredWidth: column_Id.width

                                Text {
                                    id: text_1
                                    text:  left_main_source.left_speed_object.vector_Indicator_Switch[index]
                                    color: "white"
                                    font.pixelSize: switch_optical_1.height * 0.5
                                    anchors.left: parent.left
                                    anchors.leftMargin: parent.width * 0.05
                                }

                                Switch {
                                    id: switch_optical_1
                                    property color checkedColor: "#0ACF97";
                                    Layout.preferredWidth: micro_rectangle.width * 0.2
                                    Layout.preferredHeight: micro_rectangle.height * 0.08
                                    anchors.right: parent.right
                                    hoverEnabled: true

                                    indicator: Rectangle {
                                        width: switch_optical_1.width * 0.8
                                        height: switch_optical_1.height * 0.8
                                        radius: height / 2
                                        color: switch_optical_1.checked ? switch_optical_1.checkedColor : "gray"
                                        border.width: 2
                                        border.color: switch_optical_1.checked ? switch_optical_1.checkedColor : "gray"

                                        Rectangle {
                                            x: switch_optical_1.checked ? parent.width - width - 2 : 1
                                            width: switch_optical_1.checked ? parent.height - 4 : parent.height - 2
                                            height: width
                                            radius: width / 2
                                            anchors.verticalCenter: parent.verticalCenter
                                            color: "white"
                                            border.color: "#D5D5D5"

                                            Behavior on x {
                                                NumberAnimation { duration: 200 }
                                            }
                                        }
                                    }

                                    onClicked: {
                                        left_main_source.left_speed_object.vector_Indicator[index] = !left_main_source.left_speed_object.vector_Indicator[index]
                                        left_main_source.update_indicators();
                                    }
                                }
                            }
                        }
                    }
        }

}
