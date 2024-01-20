import QtQuick 2.0

Rectangle {
    id: headerMap
    anchors.top: parent.top
    width: parent.width
    height: parent.height/25
    color: "lightgray"
    opacity: 0.95

    Text {
        id: redittext
        text: header_temp_qml.currentTime
        color: "black"
        font.bold: true
        font.pixelSize: headerMap.height/1.5
        anchors.right: parent.right
        anchors.verticalCenter: headerMap.verticalCenter
        anchors.rightMargin: 10
    }

    Text {
        id: textTemp
        text: header_temp_qml.temperature + "°C"
        color: "black"
        font.bold: true
        font.pixelSize: headerMap.height/1.5
        anchors.left: redittext.horizontalCenter
        anchors.leftMargin: -parent.width * 0.15
        anchors.verticalCenter: headerMap.verticalCenter
    }

    Text {
        id: textAccount
        text: qsTr("Vladislav");
        color: "black"
        font.bold: true
        font.pixelSize: headerMap.height/1.5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: headerMap.verticalCenter
    }

    Image {
        id: imageAccount
        source: "qrc:/ui/account.png"
        anchors.right: textAccount.left
        anchors.verticalCenter: headerMap.verticalCenter
        anchors.rightMargin: parent.width * 0.01
        height: textAccount.height*0.9
        width: textAccount.width*0.3
    }

    Image {
        id: imageLocer
        source: "qrc:/ui/locker.png"
        anchors.right: headerMap.left
        anchors.verticalCenter: headerMap.verticalCenter
        anchors.rightMargin: -parent.width * 0.085
        height: textAccount.height*0.8
        width: textAccount.width*0.25
    }

    Image {
        id: imageSoundHeader
        source: "qrc:/ui/soundheader.png"
        anchors.left: imageLocer.right
        anchors.verticalCenter: headerMap.verticalCenter
        anchors.leftMargin: parent.width*0.05
        height: textAccount.height*0.9
        width: textAccount.width*0.3
    }

    Text {
        id: textSoundHeader
        text: footer_temp_qml.soundTemp
        color: "black"
        font.bold: true
        font.pixelSize: headerMap.height/1.5
        anchors.left: imageSoundHeader.right
        anchors.leftMargin: parent.width*0.003
        anchors.verticalCenter: headerMap.verticalCenter
    }

}
