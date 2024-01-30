// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia

Item {
    id: root
    implicitWidth: 200

    function clear() {
        elements.clear();
    }

    function read(metadata) {
        if (metadata) {
            for (var key of metadata.keys()) {
                if (metadata.metaDataKeyToString(key) === 'Title')
                    right_main_source.name_music = metadata.stringValue(key)
                if(metadata.metaDataKeyToString(key) === 'Contributing artist')
                    right_main_source.name_artist = metadata.stringValue(key)
            }
        }
    }

    ListModel {
        id: elements
    }

    Frame {
        anchors.fill: parent
        padding: 15

        background: Rectangle {
            color: "lightgray"
            opacity: 0.7
        }

        ListView {
            id: metadataList
            visible: elements.count > 0
            anchors.fill: parent
            model: elements
            delegate: RowLayout {
                width: metadataList.width
                // Text {
                //     Layout.preferredWidth: 90
                //     text: model.name + ":"
                //     horizontalAlignment: Text.AlignRight
                //     color: "green"
                // }
                Text {
                    Layout.fillWidth: true
                    text: model.value
                    wrapMode: Text.WrapAnywhere
                }
            }
        }

        Text {
            id: metadataNoList
            visible: elements.count === 0
            text: qsTr("No metadata present")
        }
    }
}
