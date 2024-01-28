import QtQuick
import QtQuick.Controls
import QtLocation
import QtPositioning

MapView {
    id: view

    function calculateMarkerRoute()
    {
        routeQuery.clearWaypoints();
        for (var i = currentMarker; i< view.markers.length; i++){
            routeQuery.addWaypoint(markers[i].coordinate)
        }
        routeQuery.travelModes = RouteQuery.CarTravel
        routeQuery.routeOptimizations = RouteQuery.ShortestRoute

        routeModel.update();
    }

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

        //! [routerequest1]
        routeModel.update();
        //! [routerequest1]

        //! [routerequest2]
        // center the map on the start coord
        view.map.center = startCoordinate;
        //! [routerequest2]
    }

    MapQuickItem {
        id: mePoisition
        parent: view.map
        sourceItem: Rectangle { width: 14; height: 14; color: "#251ee4"; border.width: 2; border.color: "white"; smooth: true; radius: 7 }
        coordinate: toCoordinate
        opacity: 1.0
        anchorPoint: Qt.point(sourceItem.width/2, sourceItem.height/2)
        visible: true
    }
    MapQuickItem {
        parent: view.map
        sourceItem: Text{
            text: qsTr("You're here!")
            color:"#242424"
            font.bold: true
            styleColor: "#ECECEC"
            style: Text.Outline
        }
        coordinate: toCoordinate
        anchorPoint: Qt.point(-mePoisition.sourceItem.width * 0.5, mePoisition.sourceItem.height * 1.5)
        visible: true
    }


    MapQuickItem {
        id: poiTheQtComapny
        parent: view.map
        sourceItem: Rectangle { width: 14; height: 14; color: "#e41e25"; border.width: 2; border.color: "white"; smooth: true; radius: 7 }
        coordinate: fromCoordinate
        opacity: 1.0
        anchorPoint: Qt.point(sourceItem.width/2, sourceItem.height/2)
    }

    MapQuickItem {
        parent: view.map
        sourceItem: Text{
            text: "Vladislav"
            color:"#242424"
            font.bold: true
            styleColor: "#ECECEC"
            style: Text.Outline
        }
        coordinate: poiTheQtComapny.coordinate
        anchorPoint: Qt.point(-poiTheQtComapny.sourceItem.width * 0.5, poiTheQtComapny.sourceItem.height * 1.5)
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
            id: route
            route: routeData
            line.color: "blue"
            line.width: 5
            smooth: true
            opacity: 0.8
     //! [routedelegate0]
            TapHandler {
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onLongPressed: showRouteMenu(view.map.toCoordinate(tapHandler.point.position))
                onSingleTapped: (eventPoint, button) => {
                    if (button === Qt.RightButton)
                        showRouteMenu(view.map.toCoordinate(tapHandler.point.position))
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
