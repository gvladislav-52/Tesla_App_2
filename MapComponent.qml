import QtQuick
import QtQuick.Controls
import QtLocation
import QtPositioning

MapView {
    id: view

    function calculateCoordinateRoute(startCoordinate, endCoordinate)
    {
        //! [routerequest0]
        // clear away any old data in the query
        routeQuery.clearWaypoints();
        // add the start and end coords as waypoints on the route
        routeQuery.addWaypoint(startCoordinate)
        routeQuery.addWaypoint(endCoordinate)
        routeQuery.travelModes = RouteQuery.CarTravel
        routeQuery.routeOptimizations = RouteQuery.FastestRoute
        //! [routerequest0]

        to_coordinate.visible = true
        //! [routerequest1]
        routeModel.update();
        //! [routerequest1]

        //! [routerequest2]
        // center the map on the start coord
        view.map.center = startCoordinate;
        //! [routerequest2]
    }

    function clearMapRoute()
    {
        routeQuery.clearWaypoints();
        to_coordinate.visible = false
        routeModel.update();
    }

    MapQuickItem {
        id: to_coordinate
        parent: view.map
        sourceItem: Rectangle { width: 14; height: 14; color: "#251ee4"; border.width: 2; border.color: "white"; smooth: true; radius: 7 }
        coordinate: right_main_source.right_map_object.to_coordinate_temp
        opacity: 1.0
        anchorPoint: Qt.point(sourceItem.width/2, sourceItem.height/2)
        visible: true
    }
    MapQuickItem {
        parent: view.map
        sourceItem: Text{
            text: qsTr("FINISH!")
            color:{if(right_main_source.temp_DayNightMap) return "black"
                else return "yellow"
            }
            font.bold: true
            //style: Text.Outline
        }
        coordinate: to_coordinate.coordinate
        anchorPoint: Qt.point(-to_coordinate.sourceItem.width * 0.5, to_coordinate.sourceItem.height * 1.5)
        visible: to_coordinate.visible
    }


    MapQuickItem {
        id: from_coordinate
        parent: view.map
        sourceItem: Rectangle { width: 14; height: 14; color: "#e41e25"; border.width: 2; border.color: "white"; smooth: true; radius: 7 }
        coordinate: right_main_source.right_map_object.from_coordinate_temp
        opacity: 1.0
        anchorPoint: Qt.point(sourceItem.width/2, sourceItem.height/2)
    }

    MapQuickItem {
        parent: view.map
        sourceItem: Text{
            text: qsTr("VLADISLAV")
            color:{if(right_main_source.temp_DayNightMap) return "black"
                else return "yellow"
            }
            font.bold: true
            styleColor: "white"
            //style: Text.Outline
        }
        coordinate: from_coordinate.coordinate
        anchorPoint: Qt.point(-from_coordinate.sourceItem.width * 0.5, from_coordinate.sourceItem.height * 1.5)
    }

    MapSliders {
        id: sliders
        z: view.map.z + 3
        mapSource: map
        edge: Qt.RightEdge
    }

    //! [routemodel0]
    RouteModel {
        id: routeModel
        plugin : view.map.plugin
        query:  RouteQuery {
            id: routeQuery
        }
    }
    //! [routemodel0]

    //! [routedelegate0]
    Component {
        id: routeDelegate
        MapRoute {
            id: route_MapRote
            visible: to_coordinate.visible
            route: routeData
            line.color: {if(right_main_source.temp_DayNightMap) return "blue"
                                        else return "yellow"
            }
            line.width: 5
            smooth: true
            opacity: 0.8
     //! [routedelegate0]
            TapHandler {
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onLongPressed: showRouteMenu(view.map.right_main_source.right_map_object.to_coordinate_temp(tapHandler.point.position))
                onSingleTapped: (eventPoint, button) => {
                    if (button === Qt.RightButton)
                        showRouteMenu(view.map.right_main_source.right_map_object.to_coordinate_temp(tapHandler.point.position))
                }
            }
        }
    }

    //! [geocodemodel0]
    GeocodeModel {
        id: geocodeModel
        plugin: view.map.plugin
        onStatusChanged: {
            if ((status == GeocodeModel.Ready) || (status == GeocodeModel.Error))
                view.geocodeFinished()
        }
        onLocationsChanged:
        {
            if (count === 1) {
                view.map.center.latitude = get(0).coordinate.latitude
                view.map.center.longitude = get(0).coordinate.longitude
            }
        }
    }
    //! [geocodemodel0]

    //! [routeview0]
    MapItemView {
        parent: view.map
        model: routeModel
        delegate: routeDelegate
        autoFitViewport: true
    }
    //! [routeview0]
}
