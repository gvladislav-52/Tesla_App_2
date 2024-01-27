import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.0

Item {

    ColumnLayout {
        anchors.fill: parent
    Rectangle {
        color: "white"
        width: 200
        height: 200

        Image {
            source: "qrc:/ui/thunder.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 15
            height: parent.height * 0.5
            anchors.top: parent.top
            fillMode: Image.PreserveAspectFit
        }

        Rectangle {
            color: "black"
            width: parent.width
            height: 3
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }

        Image {
            id: battery
            source: "qrc:/ui/battery/battery.png"
            anchors.right: parent.right
            width: parent.width * 0.15
            height: parent.height * 0.25
            anchors.bottomMargin: 10
            anchors.rightMargin: 5
            anchors.bottom: parent.bottom
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: redittext
            text:  left_main_source.left_charge_object.battarySource + "%"
            color: "black"
            font.bold: true
            font.pixelSize: parent.width * 0.04
            anchors.right: battery.left
            anchors.verticalCenter: battery.verticalCenter
            anchors.rightMargin: 5
        }

        Text {
            text: qsTr("Charging Complete:")
            color: "black"
            font.bold: true
            font.pixelSize: parent.width * 0.04
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 5
            anchors.bottomMargin: 12
        }
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.minimumHeight: parent.height/6
    }

    Item {
        width: 200
        height: 616

        Image {
            id: asd
            source: "qrc:/ui/carUp2.png"
            width: 200
            height: 400
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit

            Image {
                id: rightDoor
                source: "qrc:/ui/test.png"
                width: asd.width/5
                height: asd.height/5.5
                anchors.left: asd.horizontalCenter
                anchors.leftMargin: 31
                anchors.bottom: asd.verticalCenter
                anchors.bottomMargin: -18
                fillMode: Image.PreserveAspectFit
                transformOrigin: Item.Top
                SequentialAnimation on rotation {
                        id: doorOpenAnimationRight
                        running: false
                        PropertyAnimation { target: rightDoor; property: "rotation"; to: -40; duration: 500 }
                    }
                SequentialAnimation on rotation {
                        id: revdoorOpenAnimationRight
                        running: false
                        PropertyAnimation { target: rightDoor; property: "rotation"; to: 0; duration: 500 }
                    }
            }

            Image {
                id: leftDoor
                source: "qrc:/ui/leftDoor.png"
                width: asd.width/5
                height: asd.height/5.5
                anchors.right: asd.horizontalCenter
                anchors.rightMargin: 39
                anchors.bottom: asd.verticalCenter
                anchors.bottomMargin: -18
                fillMode: Image.PreserveAspectFit
                transformOrigin: Item.Top
                SequentialAnimation on rotation {
                        id: doorOpenAnimationLeft
                        running: false
                        PropertyAnimation { target: leftDoor; property: "rotation"; to: 40; duration: 500 }
                    }
                SequentialAnimation on rotation {
                        id: revdoorOpenAnimationLeft
                        running: false
                        PropertyAnimation { target: leftDoor; property: "rotation"; to: 0; duration: 500 }
                    }
            }

            Image {
                id: leftDoorBottom
                source: "qrc:/ui/LeftDoorBottom.png"
                width: asd.width/5
                height: asd.height/5.5
                anchors.right: asd.horizontalCenter
                anchors.rightMargin: 34
                anchors.top: asd.verticalCenter
                anchors.topMargin: 10
                fillMode: Image.PreserveAspectFit
                transformOrigin: Item.Top
                SequentialAnimation on rotation {
                        id: doorOpenAnimationLeftBottom
                        running: false
                        PropertyAnimation { target: leftDoorBottom; property: "rotation"; to: 40; duration: 500 }
                    }
                SequentialAnimation on rotation {
                        id: revdoorOpenAnimationLeftBottom
                        running: false
                        PropertyAnimation { target: leftDoorBottom; property: "rotation"; to: 0; duration: 500 }
                    }
            }

            Image {
                id: rightDoorBottom
                source: "qrc:/ui/RightDoorBottom.png"
                width: asd.width/5
                height: asd.height/5.5
                anchors.left: asd.horizontalCenter
                anchors.leftMargin: 27
                anchors.top: asd.verticalCenter
                anchors.topMargin: 10
                fillMode: Image.PreserveAspectFit
                transformOrigin: Item.Top
                SequentialAnimation on rotation {
                        id: doorOpenAnimationRightBottom
                        running: false
                        PropertyAnimation { target: rightDoorBottom; property: "rotation"; to: -40; duration: 500 }
                    }
                SequentialAnimation on rotation {
                        id: revdoorOpenAnimationRightBottom
                        running: false
                        PropertyAnimation { target: rightDoorBottom; property: "rotation"; to: 0; duration: 500 }
                    }
            }

            Image
            {
                id: closeCapot
                source: "qrc:/ui/CapotClose.png"
                width: asd.width/2
                height: asd.height/2
                fillMode: Image.PreserveAspectFit
                anchors.left: parent.horizontalCenter
                anchors.leftMargin: -54
                anchors.bottom: parent.verticalCenter
                anchors.bottomMargin: 2
                visible: left_main_source.left_charge_object.vector_carDoor[4]
            }

            Image
            {
                id: openCapot
                source: "qrc:/ui/CapotOpen.png"
                width: asd.width/2
                height: asd.height/2
                fillMode: Image.PreserveAspectFit
                anchors.left: parent.horizontalCenter
                anchors.leftMargin: -54
                anchors.bottom: parent.verticalCenter
                anchors.bottomMargin: -5
                visible: !left_main_source.left_charge_object.vector_carDoor[4]
            }

            Image
            {
                id: closeBag
                source: "qrc:/ui/CloseBag.png"
                width: asd.width/2.3
                height: asd.height/2.3
                fillMode: Image.PreserveAspectFit
                anchors.left: parent.horizontalCenter
                anchors.leftMargin: -48
                anchors.top: parent.verticalCenter
                anchors.topMargin: 24
                visible: left_main_source.left_charge_object.vector_carDoor[5]
            }

            Image
            {
                id: openBag
                source: "qrc:/ui/OpenBag.png"
                width: asd.width/2.3
                height: asd.height/2.3
                fillMode: Image.PreserveAspectFit
                anchors.left: parent.horizontalCenter
                anchors.leftMargin: -48
                anchors.top: parent.verticalCenter
                anchors.topMargin: 12
                visible: !left_main_source.left_charge_object.vector_carDoor[5]

            }

            Image
            {
                id: energyBut
                source: "qrc:/ui/energyBut.png"
                width: asd.width/4
                height: asd.height/4
                fillMode: Image.PreserveAspectFit
                anchors.right: parent.horizontalCenter
                anchors.rightMargin: 53
                anchors.top: parent.verticalCenter
                anchors.topMargin: 80
                visible: !left_main_source.left_charge_object.vector_carDoor[6]

            }
        }

        ToolButton
        {
            id: capotDoorButton
            text: "Open hood"
            width: parent.width * 0.2
            height: parent.height * 0.1
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: parent.height*0.35
            anchors.right: parent.right
            anchors.rightMargin: parent.width*0.1

            hoverEnabled: true
            onClicked: {
                left_main_source.update_carDoor(4);
            }

            background: Rectangle {
                id: rectangleCapotDoorButton
                color:  left_main_source.left_charge_object.vector_carDoor[4] ? "lightgray" : "red"
                radius: 15*parent.width
                border.color : "gray"
                border.width: 1
            }
        }

        ToolButton
        {
            id: bagDoorButton
            text: "Open trunk"
            width: parent.width * 0.2
            height: parent.height * 0.1
            anchors.top: parent.verticalCenter
            anchors.topMargin: parent.height*0.4
            anchors.right: parent.right
            anchors.rightMargin: parent.width*0.1

            hoverEnabled: true
            onClicked: {
                left_main_source.update_carDoor(5);
            }

            background: Rectangle {
                id: rectangleBagDoorButton
                color:  left_main_source.left_charge_object.vector_carDoor[5] ? "lightgray" : "red"
                radius: 15*parent.width
                border.color : "gray"
                border.width: 1
            }
        }

        ToolButton
        {
            id: energyDoorButton
            text: "Open ePort"
            width: parent.width * 0.2
            height: parent.height * 0.1
            anchors.top: parent.verticalCenter
            anchors.topMargin: parent.height*0.4
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.1

            hoverEnabled: true
            onClicked: {
                left_main_source.update_carDoor(6);
            }

            background: Rectangle {
                id: rectangleEnergyDoorButton
                color:  left_main_source.left_charge_object.vector_carDoor[6] ? "lightgray" : "red"
                radius: 15*parent.width
                border.color : "gray"
                border.width: 1
            }
        }



        ToolButton
        {
            id: rightTopDoorButton
            text: "Open door"
            width: parent.width * 0.2
            height: parent.height * 0.1
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: parent.height*0.1
            anchors.right: parent.right

            hoverEnabled: true
            onClicked: {
                left_main_source.update_carDoor(0);
                if(left_main_source.left_charge_object.vector_carDoor[0])
                    revdoorOpenAnimationRight.running = true
                else doorOpenAnimationRight.running = true
            }

            background: Rectangle {
                id: rectangleRightTopDoorButton
                color:  left_main_source.left_charge_object.vector_carDoor[0] ? "lightgray" : "red"
                radius: 15*parent.width
                border.color : "gray"
                border.width: 1
            }
        }

        ToolButton
            {
                id: rightBottomDoorButton
                text: "Open door"
                width: parent.width * 0.2
                height: parent.height * 0.1
                anchors.top: parent.verticalCenter
                anchors.topMargin: parent.height * 0.15
                anchors.right: parent.right

                onClicked: {
                    left_main_source.update_carDoor(1);
                    if(left_main_source.left_charge_object.vector_carDoor[1])
                        revdoorOpenAnimationRightBottom.running = true
                    else doorOpenAnimationRightBottom.running = true
                }

                background: Rectangle {
                    color: left_main_source.left_charge_object.vector_carDoor[1] ? "lightgray" : "red"
                    radius: 15*parent.width
                    border.color : "gray"
                    border.width: 1
                }
            }

        ToolButton
        {
            id: leftTopDoorButton
            text: "Open door"
            width: parent.width * 0.2
            height: parent.height * 0.1
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: parent.height*0.1
            anchors.left: parent.left

            hoverEnabled: true
            onClicked: {
                left_main_source.update_carDoor(2);
                if(left_main_source.left_charge_object.vector_carDoor[2])
                    revdoorOpenAnimationLeft.running = true
                else doorOpenAnimationLeft.running = true
            }

            background: Rectangle {
                id: rectangleLeftTopDoorButton
                color: left_main_source.left_charge_object.vector_carDoor[2] ? "lightgray" : "red"
                radius: 15*parent.width
                border.color : "gray"
                border.width: 1
            }
        }

        ToolButton
            {
                id: leftBottomDoorButton
                text: "Open door"
                width: parent.width * 0.2
                height: parent.height * 0.1
                anchors.top: parent.verticalCenter
                anchors.topMargin: parent.height * 0.15
                anchors.left: parent.left

                onClicked: {
                    left_main_source.update_carDoor(3);
                    if(left_main_source.left_charge_object.vector_carDoor[3])
                        revdoorOpenAnimationLeftBottom.running = true
                    else doorOpenAnimationLeftBottom.running = true
                }

                background: Rectangle {
                    color: left_main_source.left_charge_object.vector_carDoor[3] ? "lightgray" : "red"
                    radius: 15*parent.width
                    border.color : "gray"
                    border.width: 1
                }
            }

        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.minimumHeight: parent.height/2
    }
    }
}
