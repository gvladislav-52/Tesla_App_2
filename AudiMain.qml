// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia


Item {
    id: root
    visible: true
    // minimumWidth: 750
    // minimumHeight: 180
    // title: qsTr("Multimedia Player")
    property alias source: mediaPlayer.source

    Popup {
        id: mediaError
        anchors.centerIn: Overlay.overlay
        Text {
            id: mediaErrorText
        }
    }

    MediaPlayer {
        id: mediaPlayer

        function updateMetadata() {
                if (mediaPlayer.metaData) {
                    for (var key of mediaPlayer.metaData.keys()) {
                        if (mediaPlayer.metaData.metaDataKeyToString(key) === 'Title')
                            right_main_source.name_music = mediaPlayer.metaData.stringValue(key)
                        if(mediaPlayer.metaData.metaDataKeyToString(key) === 'Contributing artist')
                            right_main_source.name_artist = mediaPlayer.metaData.stringValue(key)
                    }
                }
        }

        videoOutput: videoOutput
        audioOutput: AudioOutput {
            id: audio
            muted: playbackControl.muted
            volume: playbackControl.volume
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

    // PlayerMenuBar {
    //     id: menuBar

    //     //anchors.left: parent.left
    //     //anchors.right: parent.right
    //     visible: !videoOutput.fullScreen

    //     mediaPlayer: mediaPlayer
    //     videoOutput: videoOutput
    //     metadataInfo: metadataInfo
    //     //audioTracksInfo: audioTracksInfo
    //     //videoTracksInfo: videoTracksInfo
    //     //subtitleTracksInfo: subtitleTracksInfo

    //     //onClosePlayer: root.close()
    // }

    RowLayout
    {
        anchors.fill: parent
        anchors.verticalCenter: parent.verticalCenter
        VideoOutput {
            id: videoOutput

            Layout.maximumWidth: parent.width * 0.3
            //width: parent.width *0.4
            Layout.maximumHeight: parent.height * 0.9
            anchors.left: parent.left

            property bool fullScreen: false
            // anchors.top: fullScreen ? parent.top : menuBar.bottom
            // anchors.bottom: playbackControl.top

           // anchors.verticalCenter: parent.verticalCenter
            //anchors.left: parent.left

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
                Layout.fillHeight: true
                Layout.fillWidth: true

                Layout.preferredWidth: parent.width * 0.1
            }

        }

        ColumnLayout
        {
        Text
        {
            id: text_artist
            text: right_main_source.name_artist
        }

        Text
        {
            id: text_music
            text: right_main_source.name_music
        }
        }


        PlaybackControl {                           //Управление песней
            id: playbackControl

            width: parent.width *0.5
            height: parent.height *0.5
            // anchors.left: parent.horizontalCenter
            //anchors.verticalCenter: parent.verticalCenter
            //anchors.verticalCenter: parent.verticalCenter
            // anchors.bottom: parent.bottom
            // anchors.left: parent.left
            // anchors.right: parent.right

            mediaPlayer: mediaPlayer

            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.preferredWidth: parent.width * 0.9
        }
    }

    // VideoOutput {
    //     id: videoOutput
    //     width: parent.width *0.4
    //     height: parent.height *0.8

    //     property bool fullScreen: false
    //     // anchors.top: fullScreen ? parent.top : menuBar.bottom
    //     // anchors.bottom: playbackControl.top

    //     anchors.verticalCenter: parent.verticalCenter
    //     anchors.left: parent.left
    //     anchors.leftMargin: -parent.width*0.075

    //     TapHandler {
    //         onDoubleTapped: {
    //             parent.fullScreen ?  showNormal() : showFullScreen()
    //             parent.fullScreen = !parent.fullScreen
    //         }
    //         onTapped: {
    //             metadataInfo.visible = false
    //             //audioTracksInfo.visible = false
    //             //videoTracksInfo.visible = false
    //             //subtitleTracksInfo.visible = false
    //         }
    //     }
    // }

    // Text
    // {
    //     id: name_text_music
    //     text: right_main_source.name_music
    // }

    // PlaybackControl {                           //Управление песней
    //     id: playbackControl

    //     width: parent.width *0.5
    //     height: parent.height *0.5
    //     anchors.left: parent.horizontalCenter
    //     anchors.verticalCenter: parent.verticalCenter
    //     //anchors.verticalCenter: parent.verticalCenter
    //     // anchors.bottom: parent.bottom
    //     // anchors.left: parent.left
    //     // anchors.right: parent.right

    //     mediaPlayer: mediaPlayer
    // }

    // TracksInfo {
    //     id: audioTracksInfo

    //     anchors.right: parent.right
    //     anchors.top: videoOutput.fullScreen ? parent.top : menuBar.bottom
    //     anchors.bottom: playbackControl.opacity ? playbackControl.bottom : parent.bottom

    //     visible: false
    //     //onSelectedTrackChanged:  mediaPlayer.activeAudioTrack = audioTracksInfo.selectedTrack
    // }

    // TracksInfo {                               //вывод информации об видео
    //     id: videoTracksInfo

    //     anchors.right: parent.right
    //     anchors.top: videoOutput.fullScreen ? parent.top : menuBar.bottom
    //     anchors.bottom: playbackControl.opacity ? playbackControl.bottom : parent.bottom

    //     visible: false
    //     onSelectedTrackChanged: mediaPlayer.activeVideoTrack = videoTracksInfo.selectedTrack
    // }

    // TracksInfo {                               //вывод информации об треке
    //     id: subtitleTracksInfo

    //     anchors.right: parent.right
    //     anchors.top: videoOutput.fullScreen ? parent.top : menuBar.bottom
    //     anchors.bottom: playbackControl.opacity ? playbackControl.bottom : parent.bottom

    //     visible: false
    //     onSelectedTrackChanged: mediaPlayer.activeSubtitleTrack = subtitleTracksInfo.selectedTrack
    // }
}


