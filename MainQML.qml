import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    minimumWidth: 1240
    minimumHeight: 747
    visible: true
    title: qsTr("Tesla Application by VG")

    ColumnLayout {
        anchors.fill: parent
        RowLayout {
            anchors.fill: parent
            MainLeftWidget {
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width * 0.3
            }

            MainRightWidget {
                id: rightchild
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width * 0.7
            }
        }
        SelectorWidget {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.13
        }
    }

    function initializeProviders() {
                rightchild.initializeProviders()
            }
}
