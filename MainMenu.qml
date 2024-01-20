// Copyright (C) 2022 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtLocation

Item {
    id: menuBar
    property variant mapTypeMenu: mapTypeMenu
    property variant plugin

    signal selectMapType(variant mapType)

    function clearMenu(menu)
    {
        while (menu.count)
            menu.removeItem(menu.itemAt(0))
    }

    Item {
        id: mapTypeMenu

        Component {
            id: mapTypeMenuActionComponent
            Action {

            }
        }
        function createMenu(map, num = 0)
        {
            clearMenu(mapTypeMenu)
            createMapTypeMenuItem(map.supportedMapTypes[num], map.activeMapType === map.supportedMapTypes[num]);
        }

        function createMapTypeMenuItem(mapType, checked)
        {
            addAction(mapview.map.activeMapType = mapType)
        }
    }
}
