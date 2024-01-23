import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts


    Rectangle
    {
        id: micro_rectangle
        color: "#1f1f1f"

        ColumnLayout
        {
            anchors.fill: parent
            Switch {
                id: switch_optical_1
                property color checkedColor: "#0ACF97"
                Layout.preferredWidth: parent.width * 0.2
                Layout.preferredHeight: parent.height * 0.075

                hoverEnabled: true
                indicator: Rectangle {
                    width: switch_optical_1.width * 0.8
                    height: switch_optical_1.height * 0.8
                    radius: height / 2
                    color: switch_optical_1.checked ? switch_optical_1.checkedColor : "white"
                    border.width: 2
                    border.color: switch_optical_1.checked ? switch_optical_1.checkedColor : "#E5E5E5"

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

                onClicked: indicator_temp_qml.indicator_str[0] = !indicator_temp_qml.indicator_str[0];
            }

            Switch {
                id: switch_optical_2
                property color checkedColor: "#0ACF97"
                Layout.preferredWidth: parent.width * 0.2
                Layout.preferredHeight: parent.height * 0.075

                hoverEnabled: true
                indicator: Rectangle {
                    width: switch_optical_2.width * 0.8
                    height: switch_optical_2.height * 0.8
                    radius: height / 2
                    color: switch_optical_2.checked ? switch_optical_2.checkedColor : "white"
                    border.width: 2
                    border.color: switch_optical_2.checked ? switch_optical_2.checkedColor : "#E5E5E5"

                    Rectangle {
                        x: switch_optical_2.checked ? parent.width - width - 2 : 1
                        width: switch_optical_2.checked ? parent.height - 4 : parent.height - 2
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

                onClicked: indicator_temp_qml.indicator_str[1] = !indicator_temp_qml.indicator_str[1];
            }

            Switch {
                id: switch_optical_3
                property color checkedColor: "#0ACF97"
                Layout.preferredWidth: parent.width * 0.2
                Layout.preferredHeight: parent.height * 0.075

                hoverEnabled: true
                indicator: Rectangle {
                    width: switch_optical_3.width * 0.8
                    height: switch_optical_3.height * 0.8
                    radius: height / 2
                    color: switch_optical_3.checked ? switch_optical_3.checkedColor : "white"
                    border.width: 2
                    border.color: switch_optical_3.checked ? switch_optical_3.checkedColor : "#E5E5E5"

                    Rectangle {
                        x: switch_optical_3.checked ? parent.width - width - 2 : 1
                        width: switch_optical_3.checked ? parent.height - 4 : parent.height - 2
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

                onClicked: indicator_temp_qml.indicator_str[2] = !indicator_temp_qml.indicator_str[1];
            }

            Switch {
                id: switch_optical_4
                property color checkedColor: "#0ACF97"
                Layout.preferredWidth: parent.width * 0.2
                Layout.preferredHeight: parent.height * 0.075

                hoverEnabled: true
                indicator: Rectangle {
                    width: switch_optical_4.width * 0.8
                    height: switch_optical_4.height * 0.8
                    radius: height / 2
                    color: switch_optical_4.checked ? switch_optical_4.checkedColor : "white"
                    border.width: 2
                    border.color: switch_optical_4.checked ? switch_optical_4.checkedColor : "#E5E5E5"

                    Rectangle {
                        x: switch_optical_4.checked ? parent.width - width - 2 : 1
                        width: switch_optical_4.checked ? parent.height - 4 : parent.height - 2
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

                onClicked: indicator_temp_qml.indicator_str[3] = !indicator_temp_qml.indicator_str[3];
            }

            Switch {
                id: switch_optical_5
                property color checkedColor: "#0ACF97"
                Layout.preferredWidth: parent.width * 0.2
                Layout.preferredHeight: parent.height * 0.075

                hoverEnabled: true
                indicator: Rectangle {
                    width: switch_optical_5.width * 0.8
                    height: switch_optical_5.height * 0.8
                    radius: height / 2
                    color: switch_optical_5.checked ? switch_optical_5.checkedColor : "white"
                    border.width: 2
                    border.color: switch_optical_5.checked ? switch_optical_5.checkedColor : "#E5E5E5"

                    Rectangle {
                        x: switch_optical_5.checked ? parent.width - width - 2 : 1
                        width: switch_optical_5.checked ? parent.height - 4 : parent.height - 2
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

                onClicked: indicator_temp_qml.indicator_str[4] = !indicator_temp_qml.indicator_str[4];
            }

            Switch {
                id: switch_optical_6
                property color checkedColor: "#0ACF97"
                Layout.preferredWidth: parent.width * 0.2
                Layout.preferredHeight: parent.height * 0.075

                hoverEnabled: true
                indicator: Rectangle {
                    width: switch_optical_6.width * 0.8
                    height: switch_optical_6.height * 0.8
                    radius: height / 2
                    color: switch_optical_6.checked ? switch_optical_6.checkedColor : "white"
                    border.width: 2
                    border.color: switch_optical_6.checked ? switch_optical_6.checkedColor : "#E5E5E5"

                    Rectangle {
                        x: switch_optical_6.checked ? parent.width - width - 2 : 1
                        width: switch_optical_6.checked ? parent.height - 4 : parent.height - 2
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

                onClicked: indicator_temp_qml.indicator_str[5] = !indicator_temp_qml.indicator_str[5];
            }

            Switch {
                id: switch_optical_7
                property color checkedColor: "#0ACF97"
                Layout.preferredWidth: parent.width * 0.2
                Layout.preferredHeight: parent.height * 0.075

                hoverEnabled: true
                indicator: Rectangle {
                    width: switch_optical_7.width * 0.8
                    height: switch_optical_7.height * 0.8
                    radius: height / 2
                    color: switch_optical_7.checked ? switch_optical_7.checkedColor : "white"
                    border.width: 2
                    border.color: switch_optical_7.checked ? switch_optical_7.checkedColor : "#E5E5E5"

                    Rectangle {
                        x: switch_optical_7.checked ? parent.width - width - 2 : 1
                        width: switch_optical_7.checked ? parent.height - 4 : parent.height - 2
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

                onClicked: indicator_temp_qml.indicator_str[6] = !indicator_temp_qml.indicator_str[6];
            }

            Switch {
                id: switch_optical_8
                property color checkedColor: "#0ACF97"
                Layout.preferredWidth: parent.width * 0.2
                Layout.preferredHeight: parent.height * 0.075

                hoverEnabled: true
                indicator: Rectangle {
                    width: switch_optical_8.width * 0.8
                    height: switch_optical_8.height * 0.8
                    radius: height / 2
                    color: switch_optical_8.checked ? switch_optical_8.checkedColor : "white"
                    border.width: 2
                    border.color: switch_optical_8.checked ? switch_optical_8.checkedColor : "#E5E5E5"

                    Rectangle {
                        x: switch_optical_8.checked ? parent.width - width - 2 : 1
                        width: switch_optical_8.checked ? parent.height - 4 : parent.height - 2
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

                onClicked: indicator_temp_qml.indicator_str[7] = !indicator_temp_qml.indicator_str[7];
            }

        }
    }


