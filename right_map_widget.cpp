#include "right_map_widget.h"

Right_Map_Widget::Right_Map_Widget()
{

}

QVariantMap Right_Map_Widget::getTo_coordinate_temp() const
{
    return m_to_coordinate_temp;
}

void Right_Map_Widget::setTo_coordinate_temp(double latitude, double longitude) {
    m_to_coordinate_temp["latitude"] = latitude;
    m_to_coordinate_temp["longitude"] = longitude;
    emit to_coordinate_tempChanged();
}


QVariantMap Right_Map_Widget::getFrom_coordinate_temp() const
{
    return m_from_coordinate_temp;
}

void Right_Map_Widget::setFrom_coordinate_temp(double latitude, double longitude) {
    m_from_coordinate_temp["latitude"] = latitude;
    m_from_coordinate_temp["longitude"] = longitude;
    emit from_coordinate_tempChanged();
}

void Right_Map_Widget::update_map_to_coordinate(double latitude, double longitude)
{
    m_to_coordinate_temp["latitude"] = latitude;
    m_to_coordinate_temp["longitude"] = longitude;
    emit to_coordinate_tempChanged();
}
