import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts


Rectangle {
    id: micro_rectangle
    color: "#1f1f1f"

    RowLayout {
        id: button_layout
        width: parent.width*0.7
        height: parent.height* 0.1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.1

        Text {
            id: sign_in_text
            text: "Sign In"
            Layout.preferredHeight: button_layout.height * 0.9
            font.pixelSize: button_layout.height * 0.5
            font.bold: true
            color: page_one.visible ? "#09e8e5":"white"
            anchors.left: parent.left

            MouseArea {
                anchors.fill: parent
                onClicked: page_one.visible = true;
            }

            Rectangle
            {
                anchors.top: sign_in_text.bottom
                anchors.topMargin: -parent.height*0.2
                width: sign_in_text.width
                height: sign_in_text.height * 0.1
                color: page_one.visible ? "#09e8e5":"transparent"
            }
        }

        Text {
            id: sign_up_text
            text: "Sign Up"
            Layout.preferredHeight: button_layout.height * 0.9
            font.pixelSize: button_layout.height * 0.5
            font.bold: true
            color: !page_one.visible ? "#09e8e5":"white"
            anchors.right: parent.right

            MouseArea {
                anchors.fill: parent
                onClicked: page_one.visible = false;
            }

            Rectangle
            {
                anchors.top: sign_up_text.bottom
                anchors.topMargin: -parent.height*0.2
                width: sign_up_text.width
                height: sign_up_text.height * 0.1
                color: !page_one.visible ? "#09e8e5":"transparent"
            }
        }
    }


    Item {
        id: page_one
        visible: true
        anchors.fill: parent

        ColumnLayout {
            id: colunn_textField
            width: parent.width * 0.7
            height: (parent.height-button_layout.height) * 0.6
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Text
            {
                anchors.left: parent.left
                text: "Login"
                font.pixelSize: parent.height * 0.07
                color: "white"
                anchors.bottom: text_login.top
                anchors.bottomMargin: parent.height*0.05
            }

            TextField {
                id: text_login
                placeholderText: "Enter your login here"
                Layout.preferredWidth: micro_rectangle.width * 0.8
                Layout.preferredHeight: micro_rectangle.height * 0.1
                font.pixelSize: text_login.height*0.3
                anchors.horizontalCenter: parent.horizontalCenter
                background:
                    Rectangle {
                        color: "lightgray"
                        radius: 10
                        border.color: "gray"
                        border.width: 2

                        gradient: Gradient {
                        GradientStop { position: 0.0; color: "lightgray" }
                        GradientStop { position: 2.0; color: "black" }
                        }
                    }
            }

            Text
            {
                anchors.left: parent.left
                text: "Password"
                font.pixelSize: parent.height * 0.07
                color: "white"
                anchors.bottom: text_password.top
                anchors.bottomMargin: parent.height*0.05
            }

            TextField {
                id: text_password
                placeholderText: "Enter your password here"
                echoMode: TextInput.Password
                Layout.preferredWidth: micro_rectangle.width * 0.8
                Layout.preferredHeight: micro_rectangle.height * 0.1
                font.pixelSize: text_login.height*0.3
                anchors.horizontalCenter: parent.horizontalCenter

                background:
                    Rectangle {
                        color: "lightgray"
                        radius: 10
                        border.color: "gray"
                        border.width: 2

                        gradient: Gradient {
                        GradientStop { position: 0.0; color: "lightgray" }
                        GradientStop { position: 2.0; color: "black" }
                        }
                    }
                }
            }
            Button {
                text: "Sign In!"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: parent.height * 0.1
                width: micro_rectangle.width * 0.8
                height: micro_rectangle.height * 0.1
                anchors.horizontalCenter: parent.horizontalCenter
                Layout.alignment: Qt.AlignHCenter
                font.pixelSize: parent.height*0.03
                font.bold: true

                background:
                    Rectangle {
                        color: "lightgray"
                        radius: 10
                        border.color: "black"
                        border.width: 2

                        gradient: Gradient {
                        GradientStop { position: 0.0; color: "#09e8e5" }
                        GradientStop { position: 2.0; color: "black" }
                        }
                    }
                onClicked: {
                    right_main_source.right_header_object.autoresetion(text_login.text, text_password.text)
                }
        }
    }

    Item {
        id: page_two
        visible: !page_one.visible
        anchors.fill: parent

        ColumnLayout {
            width: parent.width * 0.7
            height: (parent.height-button_layout.height) * 0.6
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Text
            {
                anchors.left: parent.left
                text: "Name"
                font.pixelSize: parent.height * 0.07
                color: "white"
            }

            TextField {
                id: text_name
                placeholderText: "Enter your name here"
                Layout.preferredWidth: micro_rectangle.width * 0.8
                Layout.preferredHeight: micro_rectangle.height * 0.1
                font.pixelSize: text_login.height*0.3
                anchors.horizontalCenter: parent.horizontalCenter

                background:
                    Rectangle {
                        color: "lightgray"
                        radius: 10
                        border.color: "gray"
                        border.width: 2

                        gradient: Gradient {
                        GradientStop { position: 0.0; color: "lightgray" }
                        GradientStop { position: 2.0; color: "black" }
                        }
                    }
            }

            Text
            {
                anchors.left: parent.left
                text: "Login"
                font.pixelSize: parent.height * 0.07
                color: "white"
            }

            TextField {
                id: text_login_reg
                placeholderText: "Enter your login here"
                Layout.preferredWidth: micro_rectangle.width * 0.8
                Layout.preferredHeight: micro_rectangle.height * 0.1
                font.pixelSize: text_login.height*0.3
                anchors.horizontalCenter: parent.horizontalCenter

                background:
                    Rectangle {
                        color: "lightgray"
                        radius: 10
                        border.color: "gray"
                        border.width: 2

                        gradient: Gradient {
                        GradientStop { position: 0.0; color: "lightgray" }
                        GradientStop { position: 2.0; color: "black" }
                        }
                    }
            }

            Text
            {
                anchors.left: parent.left
                text: "Password"
                font.pixelSize: parent.height * 0.07
                color: "white"
            }

            TextField {
                id: text_password_reg
                placeholderText: "Enter your password here"
                echoMode: TextInput.Password
                Layout.preferredWidth: micro_rectangle.width * 0.8
                Layout.preferredHeight: micro_rectangle.height * 0.1
                font.pixelSize: text_login.height*0.3
                anchors.horizontalCenter: parent.horizontalCenter

                background:
                    Rectangle {
                        color: "lightgray"
                        radius: 10
                        border.color: "gray"
                        border.width: 2

                        gradient: Gradient {
                        GradientStop { position: 0.0; color: "lightgray" }
                        GradientStop { position: 2.0; color: "black" }
                        }
                    }
            }
        }
        Button {
            text: "Sign Up!"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.1
            width: micro_rectangle.width * 0.8
            height: micro_rectangle.height * 0.1
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: parent.height*0.03
            Layout.alignment: Qt.AlignHCenter
            font.bold: true

            background:
                Rectangle {
                    color: "lightgray"
                    radius: 10
                    border.color: "black"
                    border.width: 2

                    gradient: Gradient {
                    GradientStop { position: 0.0; color: "#09e8e5" }
                    GradientStop { position: 2.0; color: "black" }
                    }
                }
            onClicked: {
                right_main_source.right_header_object.regestration(text_name.text,text_login_reg.text,text_password_reg.text)
            }
        }
    }
}
