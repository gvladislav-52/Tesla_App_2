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
            width: parent.width * 0.15
            height: parent.height * 0.5
            anchors.top: parent.top
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
            source: "qrc:/ui/battery.png"
            anchors.right: parent.right
            width: parent.width * 0.15
            height: parent.height * 0.25
            anchors.bottomMargin: 10
            anchors.rightMargin: 5
            anchors.bottom: parent.bottom
        }

        Text {
            id: redittext
            text:  qsTr("100%");
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

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            doorOpenAnimationRight.running = true
                        }
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

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            doorOpenAnimationLeftBottom.running = true
                        }
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
                visible: true
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
                visible: false
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
                visible: true
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
                visible: false

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
                visible: false

            }
        }

        ToolButton
        {
            property bool isButtonClick: true
            id: capotDoorButton
            text: "Open capot"
            width: parent.width * 0.2
            height: parent.height * 0.1
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: parent.height*0.35
            anchors.right: parent.right
            anchors.rightMargin: parent.width*0.1

            hoverEnabled: true
            onClicked: {
                closeCapot.visible = !closeCapot.visible
                openCapot.visible = !openCapot.visible
                isButtonClick = !isButtonClick
            }

            background: Rectangle {
                id: rectangleCapotDoorButton
                color:  capotDoorButton.isButtonClick ? "lightgray" : "red"
                radius: 15*parent.width
                border.color : "gray"
                border.width: 1
            }
        }

        ToolButton
        {
            property bool isButtonClick: true
            id: bagDoorButton
            text: "Open bag"
            width: parent.width * 0.2
            height: parent.height * 0.1
            anchors.top: parent.verticalCenter
            anchors.topMargin: parent.height*0.4
            anchors.right: parent.right
            anchors.rightMargin: parent.width*0.1

            hoverEnabled: true
            onClicked: {
                closeBag.visible = !closeBag.visible
                openBag.visible = !openBag.visible
                isButtonClick = !isButtonClick
            }

            background: Rectangle {
                id: rectangleBagDoorButton
                color:  bagDoorButton.isButtonClick ? "lightgray" : "red"
                radius: 15*parent.width
                border.color : "gray"
                border.width: 1
            }
        }

        ToolButton
        {
            property bool isButtonClick: true
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
                energyBut.visible = !energyBut.visible
                isButtonClick = !isButtonClick
            }

            background: Rectangle {
                id: rectangleEnergyDoorButton
                color:  energyDoorButton.isButtonClick ? "lightgray" : "red"
                radius: 15*parent.width
                border.color : "gray"
                border.width: 1
            }
        }



        ToolButton
        {
            property bool rightTopDoorCheck: false
            property bool isButtonClick: true
            id: rightTopDoorButton
            text: "Open door"
            width: parent.width * 0.2
            height: parent.height * 0.1
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: parent.height*0.1
            anchors.right: parent.right

            hoverEnabled: true
            onClicked: {
                if(rightTopDoorCheck)
                {
                    revdoorOpenAnimationRight.running = true
                }
                    else
                {
                    doorOpenAnimationRight.running = true
                }
                rightTopDoorCheck = !rightTopDoorCheck
                isButtonClick = !isButtonClick
            }

            background: Rectangle {
                id: rectangleRightTopDoorButton
                color:  rightTopDoorButton.isButtonClick ? "lightgray" : "red"
                radius: 15*parent.width
                border.color : "gray"
                border.width: 1
            }
        }

        ToolButton
            {   property bool rightBottomDoorCheck: false
                property bool isButtonClick: true
                id: rightBottomDoorButton
                text: "Open door"
                width: parent.width * 0.2
                height: parent.height * 0.1
                anchors.top: parent.verticalCenter
                anchors.topMargin: parent.height * 0.15
                anchors.right: parent.right

                onClicked: {
                    if(rightBottomDoorCheck)
                    {
                        revdoorOpenAnimationRightBottom.running = true
                    }
                        else
                    {
                        doorOpenAnimationRightBottom.running = true
                    }
                    rightBottomDoorCheck = !rightBottomDoorCheck
                    isButtonClick = !isButtonClick
                }

                background: Rectangle {
                    color: rightBottomDoorButton.isButtonClick ? "lightgray" : "red"
                    radius: 15*parent.width
                    border.color : "gray"
                    border.width: 1
                }
            }

        ToolButton
        {
            property bool leftTopDoorCheck: false
            property bool isButtonClick: true
            id: leftTopDoorButton
            text: "Open door"
            width: parent.width * 0.2
            height: parent.height * 0.1
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: parent.height*0.1
            anchors.left: parent.left

            hoverEnabled: true
            onClicked: {
                if(leftTopDoorCheck)
                {
                    revdoorOpenAnimationLeft.running = true
                }
                    else
                {
                    doorOpenAnimationLeft.running = true
                }
                leftTopDoorCheck = !leftTopDoorCheck
                isButtonClick = !isButtonClick
            }

            background: Rectangle {
                id: rectangleLeftTopDoorButton
                color:  leftTopDoorButton.isButtonClick ? "lightgray" : "red"
                radius: 15*parent.width
                border.color : "gray"
                border.width: 1
            }
        }

        ToolButton
            {
                property bool leftBottomDoorCheck: false
                property bool isButtonClick: true
                id: leftBottomDoorButton
                text: "Open door"
                width: parent.width * 0.2
                height: parent.height * 0.1
                anchors.top: parent.verticalCenter
                anchors.topMargin: parent.height * 0.15
                anchors.left: parent.left

                onClicked: {
                    if(leftBottomDoorCheck)
                    {
                        revdoorOpenAnimationLeftBottom.running = true
                    }
                        else
                    {
                        doorOpenAnimationLeftBottom.running = true
                    }
                    leftBottomDoorCheck = !leftBottomDoorCheck
                    isButtonClick = !isButtonClick
                }

                background: Rectangle {
                    color: leftBottomDoorButton.isButtonClick ? "lightgray" : "red"
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
