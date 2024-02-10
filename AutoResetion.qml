import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts


Rectangle {
    id: micro_rectangle
    color: "#1f1f1f"

    RowLayout
    {
        id: button_layout
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.1
        Button
        {
            text: "Sign In"
            onClicked: page_one.visible = true;
        }

        Button
        {
            text: "Sign Up"
            onClicked: page_one.visible = false;
        }
    }

    Item {
        id: page_one
        visible: true
        anchors.fill: parent

        ColumnLayout {
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
            }

            TextField {
                id: text_login
                placeholderText: "Enter your login here"
                Layout.preferredWidth: micro_rectangle.width * 0.8
                Layout.preferredHeight: micro_rectangle.height * 0.1
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
                id: text_password
                placeholderText: "Enter your password here"
                echoMode: TextInput.Password
                Layout.preferredWidth: micro_rectangle.width * 0.8
                Layout.preferredHeight: micro_rectangle.height * 0.1
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
            Layout.alignment: Qt.AlignHCenter

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
            onClicked: {
                right_main_source.right_header_object.regestration(text_name.text,text_login_reg.text,text_password_reg.text)
            }
        }
    }
}
