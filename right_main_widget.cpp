#include "right_main_widget.h"

Right_Main_Widget::Right_Main_Widget(QObject *parent) : QObject(parent)
{
    m_right_footer_object = new Right_Footer_Widget();
    m_right_header_object = new Right_Header_Widget();
    m_temp_DayNightMap = true;
}

Right_Main_Widget::~Right_Main_Widget()
{
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
