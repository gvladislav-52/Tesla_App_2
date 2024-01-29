#include "right_main_widget.h"

Right_Main_Widget::Right_Main_Widget(QObject *parent) : QObject(parent)
{
    m_right_footer_object = new Right_Footer_Widget();
    m_right_header_object = new Right_Header_Widget();
    m_right_map_object = new Right_Map_Widget();
    //m_right_map_object->setTo_coordinate_temp(-0, -0);
    m_right_map_object->setFrom_coordinate_temp(56.307706, 43.984085);
    m_temp_DayNightMap = true;
    m_temp_ErrorPopup.append("Enter a different address");
    m_temp_ErrorPopup.append("Please enter a valid address");
    m_temp_ErrorPopup.append("Error! Switch the selector to the PARKING gear to open the doors");
    m_temp_ErrorPopup.append("Error! Close all doors before continuing to move");
}

Right_Main_Widget::~Right_Main_Widget()
{
    delete m_right_map_object;
    delete m_right_header_object;
    delete m_right_footer_object;
}

Right_Header_Widget *Right_Main_Widget::right_header_object() const
{
    return m_right_header_object;
}

Right_Footer_Widget *Right_Main_Widget::right_footer_object() const
{
    return m_right_footer_object;
}

bool Right_Main_Widget::getTemp_DayNightMap() const
{
    return m_temp_DayNightMap;
}

void Right_Main_Widget::setTemp_DayNightMap(bool newCarLocked)
{
    if (m_temp_DayNightMap == newCarLocked)
        return;
    m_temp_DayNightMap = newCarLocked;
    emit temp_DayNightMapChanged();
}

Right_Map_Widget *Right_Main_Widget::right_map_object() const
{
    return m_right_map_object;
}

QVector<QString> Right_Main_Widget::getTemp_ErrorPopup() const
{
    return m_temp_ErrorPopup;
}

void Right_Main_Widget::setTemp_ErrorPopup(const QVector<QString> &newTemp_ErrorPopup)
{
    if (m_temp_ErrorPopup == newTemp_ErrorPopup)
        return;
    m_temp_ErrorPopup = newTemp_ErrorPopup;
    emit temp_ErrorPopupChanged();
}
