// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import QtQuick.Dialogs


Item {
    id: root
    visible: true
    property alias source: mediaPlayer.source
    property int mediaPlayerState: mediaPlayer.playbackState

    property string name_music
    property string artist_music

    Popup {
        id: mediaError
        anchors.centerIn: Overlay.overlay
        Text {
            id: mediaErrorText
        }
    }

    MediaPlayer {
        id: mediaPlayer

        function clear()
        {
            name_music = "-"
            artist_music = "-"
        }

        function updateMetadata()
        {
            mediaPlayer.clear();
            mediaPlayer.read(mediaPlayer.metaData);
        }

        function read(metadata) {
            if (metadata) {
                for (var key of metadata.keys()) {
                    if (metadata.metaDataKeyToString(key) === 'Title')
                        name_music = metadata.stringValue(key)
                    if (metadata.metaDataKeyToString(key) === 'Contributing artist')
                        artist_music = metadata.stringValue(key)
                }
            }
        }

        videoOutput: videoOutput
        audioOutput: AudioOutput {
            id: audio
            muted: right_main_source.right_footer_object.muted_music
            volume: right_main_source.right_footer_object.soundTemp/10
        }

        onErrorOccurred: { mediaErrorText.text = mediaPlayer.errorString; mediaError.open() }
        onMetaDataChanged: { updateMetadata() }
        onTracksChanged: {
            audioTracksInfo.read(mediaPlayer.audioTracks);
            audioTracksInfo.selectedTrack = mediaPlayer.activeAudioTrack;
           // videoTracksInfo.read(mediaPlayer.videoTracks);
           // videoTracksInfo.selectedTrack = mediaPlayer.activeVideoTrack;
           // subtitleTracksInfo.read(mediaPlayer.subtitleTracks);
           // subtitleTracksInfo.selectedTrack = mediaPlayer.activeSubtitleTrack;
            updateMetadata()
        }
        onActiveTracksChanged: { updateMetadata() }
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        onAccepted: {
            mediaPlayer.stop()
            mediaPlayer.source = fileDialog.currentFile
            mediaPlayer.play()
        }
    }
    RowLayout
    {
        anchors.fill: parent
        anchors.verticalCenter: parent.verticalCenter
    VideoOutput {
        id: videoOutput

        Layout.maximumWidth: parent.width * 0.4
        //width: parent.width *0.4
        Layout.maximumHeight: parent.height * 0.9
        anchors.left: parent.left
        property bool fullScreen: false

        TapHandler {
            onDoubleTapped: {
                parent.fullScreen ?  showNormal() : showFullScreen()
                parent.fullScreen = !parent.fullScreen
            }
            onTapped: {
                metadataInfo.visible = false
                //audioTracksInfo.visible = false
                //videoTracksInfo.visible = false
                //subtitleTracksInfo.visible = false
            }
        }

        Layout.fillHeight: true
        Layout.fillWidth: true

        Layout.preferredWidth: parent.width * 0.2
    }

    ColumnLayout
    {
        id: column_Id
        anchors.bottom: parent.bottom
        anchors.top: parent.top

        anchors.topMargin: parent.height * 0.3


        Rectangle
        {
            anchors.left: parent.left
            anchors.right: parent.right
            height: 30
            color: "transparent"
            clip: true

            Text
            {
                anchors.left: parent.left
                text: artist_music + ":   " + name_music
                font.pixelSize: 20
            }
        }

        Slider {
            id: mediaSlider
            anchors.left: parent.left
            anchors.right: parent.right
            enabled: mediaPlayer.seekable
            value: mediaPlayer.position / mediaPlayer.duration

            onMoved: mediaPlayer.setPosition(value * mediaPlayer.duration)

            background: Rectangle {

                    implicitWidth: column_Id.width // Изменяем ширину фона ориентируясь на вашу задачу
                    width: implicitWidth
                    height: 4
                    radius: 2
                    color: "white"

                    Rectangle {
                        width: mediaSlider.visualPosition * parent.width
                        height: 4
                        color: "black"
                        radius: 2
                    }
                }

            handle: Rectangle {
                    id: circleSlide_bearingSlider
                    // anchors.verticalCenter: mediaSlider.verticalCenter
                    x: mediaSlider.visualPosition * (mediaSlider.availableWidth - width)
                    y: -mediaSlider.height/3
                    implicitWidth: 18
                    implicitHeight: 18
                    radius: 13
                    color: "white"
                    border.color: "black"
                    border.width: 2
                }
        }

        RowLayout {
                Layout.preferredWidth: column_Id.width
                Layout.alignment: Qt.AlignHCenter // Установить выравнивающее свойство

                Text {
                    id: mediaTimeStart
                    anchors.left: parent.left
                    text: {
                        var m = Math.floor(mediaPlayer.position / 60000)
                        var ms = (mediaPlayer.position / 1000 - m * 60).toFixed(1)
                        return `${m}:${ms.padStart(4, 0)}`
                    }
                }

                Text {
                    id: mediaTimeEndt
                    anchors.right: parent.right
                    text: {
                        var totalSeconds = mediaPlayer.duration / 1000
                        var minutes = Math.floor(totalSeconds / 60)
                        var seconds = (totalSeconds % 60).toFixed(0)
                        return minutes + ":" + (seconds < 10 ? "0" + seconds : seconds)
                    }
                }
            }

    Layout.fillHeight: true
    Layout.fillWidth: true

    Layout.preferredWidth: parent.width * 0.5
    }


    Item {
        id: playbackControl
        Layout.fillHeight: true
        Layout.fillWidth: true

        Layout.preferredWidth: parent.width * 0.3
        height: frame.height

        Frame {
            id: frame
            anchors.fill: parent

            background: Rectangle {
                color: "transparent"
            }

            ColumnLayout {
                id: playbackControlPanel
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10

                RowLayout {
                    id: playerButtons

                    Layout.fillWidth: true

                    Item {
                        Layout.fillWidth: true
                    }

                    RowLayout {
                        Layout.alignment: Qt.AlignCenter
                        id: controlButtons

                        RoundButton {
                            id: leftButton
                            radius: 50.0
                            text: "<-";
                            //onClicked: mediaPlayer.
                        }

                        RoundButton {
                            id: pauseButton
                            radius: 50.0
                            text: "\u2016";
                            onClicked: mediaPlayer.pause()
                        }

                        RoundButton {
                            id: playButton
                            radius: 50.0
                            text: "\u25B6";
                            onClicked: mediaPlayer.play()
                        }

                        RoundButton {
                            id: stopButton
                            radius: 50.0
                            text: "\u25A0";
                            onClicked: mediaPlayer.stop()
                        }

                        RoundButton
                        {
                            id: addButton
                            radius: 50.0
                            text: "▲";
                            onClicked: fileDialog.open()
                        }

                        RoundButton {
                            id: rightButton
                            radius: 50.0
                            text: "->";
                            //onClicked: mediaPlayer.
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                    }
                }
            }
        }

        states: [
            State {
                name: "playing"
                when: mediaPlayerState == MediaPlayer.PlayingState
                PropertyChanges { target: pauseButton; visible: true}
                PropertyChanges { target: playButton; visible: false}
                PropertyChanges { target: stopButton; visible: true}
            },
            State {
                name: "stopped"
                when: mediaPlayerState == MediaPlayer.StoppedState
                PropertyChanges { target: pauseButton; visible: false}
                PropertyChanges { target: playButton; visible: true}
                PropertyChanges { target: stopButton; visible: false}
            },
            State {
                name: "paused"
                when: mediaPlayerState == MediaPlayer.PausedState
                PropertyChanges { target: pauseButton; visible: false}
                PropertyChanges { target: playButton; visible: true}
                PropertyChanges { target: stopButton; visible: true}
            }
        ]
    }
    }
}
