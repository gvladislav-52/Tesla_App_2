import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts

    Rectangle
    {
        color: "#1f1f1f"

        ColumnLayout
        {
        anchors.fill: parent
        Button
        {
            text: "1";
            onClicked: indicator_temp_qml.indicator_str[0] = !indicator_temp_qml.indicator_str[0];
        }

        Button
        {
            text: "2";
            onClicked: indicator_temp_qml.indicator_str[1] = !indicator_temp_qml.indicator_str[1];
        }


        Button
        {
            text: "3";
            onClicked: indicator_temp_qml.indicator_str[2] = !indicator_temp_qml.indicator_str[2];
        }

        Button
        {
            text: "4";
            onClicked: indicator_temp_qml.indicator_str[3] = !indicator_temp_qml.indicator_str[3];
        }

        Button
        {
            text: "5";
            onClicked: indicator_temp_qml.indicator_str[4] = !indicator_temp_qml.indicator_str[4];
        }


        Button
        {
            text: "6";
            onClicked: indicator_temp_qml.indicator_str[5] = !indicator_temp_qml.indicator_str[5];
        }

        Button
        {
            text: "7";
            onClicked: indicator_temp_qml.indicator_str[6] = !indicator_temp_qml.indicator_str[6];
        }

        Button
        {
            text: "8";
            onClicked: indicator_temp_qml.indicator_str[7] = !indicator_temp_qml.indicator_str[7];
        }

        }
    }
