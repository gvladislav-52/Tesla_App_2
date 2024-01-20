import QtQuick 2.0

Item {
    MapWidget {
    id: childid}
    HeaderMapWidget {}
    SelectorMapWidget {}
    MusicWidget {
           anchors.bottom: parent.bottom
           anchors.leftMargin: 5
           anchors.rightMargin: 10
           anchors.horizontalCenter: horizontalCenter
       }
    function initializeProviders() {
                childid.initializeProviders()
            }
}
