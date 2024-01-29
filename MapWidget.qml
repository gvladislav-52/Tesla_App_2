import QtQuick
import QtQuick.Controls
import QtLocation
import QtPositioning

Item {
    id: appWindow
    property string bufferText
   // property string tempText: textSearch.text
    signal selectTool();
     property variant mapview
     property variant plugin
     property variant parameters

    //property variant coordinateYou
    //property variant fromCoordinate: right_main_source.right_map_object.from_coordinate_temp
    //property variant toCoordinate: right_main_source.right_map_object.to_coordinate_temp

    signal showRoute(variant startCoordinate,variant endCoordinate)
    property string toCoordinateText

    function initializeProviders()
    {
        var provider = "osm"
        plugin = Qt.createQmlObject ('import QtLocation; Plugin{ name:"' + provider + '"}', appWindow)

        mapview = mapComponent.createObject(page);
        mapview.map.plugin = plugin;
    }

    height: parent.height
    width: parent.width
    visible: true

     Address {
         id: toAddress
         city: toCoordinateText
    }

    onSelectTool: {
        //tempGeocodeModel.reset()
        //tempGeocodeModel.endCoordinate = QtPositioning.coordinate()
        tempGeocodeModel.query = toAddress
        tempGeocodeModel.update();
        showRoute.connect(mapview.calculateCoordinateRoute)

    }

    GeocodeModel {
        id: tempGeocodeModel
        plugin: mapview.map.plugin
        property variant endCoordinate

        onStatusChanged: {
            right_main_source.right_map_object.update_map_to_coordinate(get(0).coordinate.latitude,get(0).coordinate.longitude)
            showRoute(right_main_source.right_map_object.from_coordinate_temp,right_main_source.right_map_object.to_coordinate_temp)
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        focus: true
        initialItem: Item {
            id: page

            Text {
                visible: !supportsSsl && map && mapview.activeMapType && activeMapType.metadata.isHTTPS
                text: "The active map type\n
requires (missing) SSL\n
support"
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: appWindow.width / 12
                font.bold: true
                color: "grey"
                anchors.centerIn: parent
                z: 12
            }
        }
    }

    Component {
        id: mapComponent

        MapComponent {
            id: mapview_comp
            width: page.width
            height: page.height
            map.center: right_main_source.right_map_object.from_coordinate_temp
            map.zoomLevel: (maximumZoomLevel - minimumZoomLevel)/2

            Image {
                id: mapSunSet
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.left
                    rightMargin: -parent.width * 0.055
                }

                width: parent.width/20
                height: parent.height/20
                fillMode: Image.PreserveAspectFit
                source:
                {
                    right_main_source.temp_DayNightMap ? "qrc:/ui/15810.png": "qrc:/ui/sun.png"
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        right_main_source.temp_DayNightMap =!right_main_source.temp_DayNightMap
                        if(right_main_source.temp_DayNightMap)
                            map.activeMapType = map.supportedMapTypes[0]
                        else
                            map.activeMapType = map.supportedMapTypes[3]
                    }
                }
            }


            ToolButton {
                id: naviButton
                contentItem: Image {
                    source: "qrc:/ui/navi.png"
                    fillMode: Image.PreserveAspectFit
                }
                anchors.top: mapSunSet.bottom
                anchors.topMargin: parent.height/20
                anchors.horizontalCenter: mapSunSet.horizontalCenter
                width: parent.width/20
                height: parent.height/15
                hoverEnabled: false

                background: Rectangle {
                    color: naviButton.pressed ? "lightgray" : "transparent"
                    radius: 10
                }
                onClicked:
                {
                    mapview_comp.map.center= right_main_source.right_map_object.from_coordinate_temp
                    mapview_comp.map.zoomLevel = 16
                }
            }

            Rectangle {
                id: searchRectangle
                color: "white"
                width: appWindow.width / 4
                height: appWindow.height / 15
                anchors.top: parent.top
                anchors.topMargin: parent.height / 20
                anchors.left: parent.left
                anchors.leftMargin: parent.width / 15
                radius: 4
                border.color: "black"
                border.width: 1
                clip: true

                TextInput {
                    id: textSearch
                    text: "Search..."
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.left
                        leftMargin: 5
                    }
                    width: parent.width - 10
                    verticalAlignment: TextInput.AlignVCenter
                    horizontalAlignment: TextInput.AlignLeft
                    font.pixelSize: parent.height / 3
                    selectByMouse: true

                    Keys.onReturnPressed: {
                        buttonSearch.clicked()
                    }

                    onActiveFocusChanged: {
                        if (activeFocus) {
                            bufferText = textSearch.text
                            textSearch.text = ""
                        }
                        if(!activeFocus)
                        {
                            if(textSearch.text === "")
                            {
                                textSearch.text = bufferText
                            }
                        }
                    }
                }
            }

            Popup {
                id: errorSelect
                width: appWindow.width / 1.015
                height: appWindow.height * 0.08
                visible: left_main_source.boolean_selectorSource || left_main_source.left_charge_object.boolean_carDoor
                x: ((appWindow.width - errorSelect.width) / 2)-appWindow.width*0.002
                y:  appWindow.height * 0.71

                background: Rectangle {
                    width: errorSelect.width
                    height: errorSelect.height
                    color: "red"
                    radius: 10
                    border.color: "darkred"
                    border.width: 2
                    opacity: 0.8

                    Text {
                        id:errorSelectText
                        text: left_main_source.boolean_selectorSource? right_main_source.temp_ErrorPopup[3]:right_main_source.temp_ErrorPopup[2]
                        font.pixelSize: errorSelect.height / 2
                        anchors.centerIn: parent
                        color: "white"
                    }
                }
            }


            Popup {
                id: errorPopup
                width: appWindow.width / 1.015
                height: appWindow.height * 0.08
                visible: false
                x: ((appWindow.width - errorPopup.width) / 2)-appWindow.width*0.002
                y:  appWindow.height * 0.71

                background: Rectangle {
                    width: errorPopup.width
                    height: errorPopup.height
                    color: "red"
                    radius: 10
                    border.color: "darkred"
                    border.width: 2
                    opacity: 0.8

                    Text {
                        id:errorPopupText
                        text: right_main_source.temp_ErrorPopup[0]
                        font.pixelSize: errorPopup.height / 2
                        anchors.centerIn: parent
                        color: "white"
                    }
                }
            }

            ToolButton
            {
                visible: false
                id: resetCoordinate
                icon.source: "qrc:/ui/cancel.png"
                anchors.left: buttonSearch.right
                anchors.leftMargin: searchRectangle.width / 20
                anchors.verticalCenter: buttonSearch.verticalCenter
                icon.width: buttonSearch.width*0.4
                icon.height: buttonSearch.height*0.78
                background: Rectangle
                {
                    color: "#F73E5F"
                    radius: 4
                    border.color: "black"
                    border.width: 1
                }

                onClicked:
                {
                    mapview.clearMapRoute()
                    bufferText = "-1"
                    resetCoordinate.visible = false
                    textSearch.text = "Search..."
                }
            }

            Button {
                id: buttonSearch
                enabled: plugin ? plugin.supportsRouting() : false
                anchors.left: searchRectangle.right
                anchors.leftMargin: searchRectangle.width / 20
                anchors.verticalCenter: searchRectangle.verticalCenter
                width: searchRectangle.width / 2
                height: searchRectangle.height
                hoverEnabled: false;
                background: Rectangle {
                    color: buttonSearch.pressed ? "lightgray" : "green"
                    radius: 4
                    Text {
                        id: textButton
                        text: qsTr("Enter")
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: parent.height / 2
                        color: "white"
                    }
                    border.color: "black"
                    border.width: 1
                }


                onClicked: {
                    if((textSearch.text !== "") && (textSearch.text !== "Search..." ) && (textSearch.text !== " " ) && (bufferText !== textSearch.text))
                    {
                    bufferText = textSearch.text
                    toCoordinateText = textSearch.text
                    selectTool()
                    resetCoordinate.visible = true
                    }
                    else
                    {
                        if(bufferText === textSearch.text)
                            errorPopupText.text = right_main_source.temp_ErrorPopup[0]
                        else
                            errorPopupText.text = right_main_source.temp_ErrorPopup[1]

                        errorPopup.visible = true
                    }
                }
            }
        }
    }
}
