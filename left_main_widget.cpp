#include "left_main_widget.h"

Left_Main_Widget::Left_Main_Widget(QObject *parent) : QObject(parent) {
    m_chargeStatus = true;
    m_speedStatus = false;
    m_microStatus = false;
    m_autoresStatus = false;

    m_left_speed_object = new Left_Speed_Widget();
    m_left_charge_object = new Left_Charge_Widget();
    m_left_charge_object->setBoolean_carDoor(false);
    m_left_speed_object->update_dimensions();

    for(int i = 0; i < 5; i++)
    {
        m_path_selectorSource.append("qrc:/ui/selector_button/selector_num_"+QString::number(i+1)+".png");
        m_name_selectorSource.append(false);
    }
    m_name_selectorSource[0] = true;
    setBoolean_selectorSource(false);
}

Left_Main_Widget::~Left_Main_Widget()
{
    delete m_left_charge_object;
    delete m_left_speed_object;
}

Left_Speed_Widget *Left_Main_Widget::left_speed_object() const
{
    return m_left_speed_object;
}

bool Left_Main_Widget::getChargeStatus() const
{
    return m_chargeStatus;
}

void Left_Main_Widget::setChargeStatus(bool newChargeStatus)
{
    if (m_chargeStatus == newChargeStatus)
        return;
    m_chargeStatus = newChargeStatus;
    emit chargeStatusChanged();
}

bool Left_Main_Widget::getSpeedStatus() const
{
    return m_speedStatus;
}

void Left_Main_Widget::setSpeedStatus(bool newSpeedStatus)
{
    if (m_speedStatus == newSpeedStatus)
        return;
    m_speedStatus = newSpeedStatus;
    emit speedStatusChanged();
}

bool Left_Main_Widget::getMicroStatus() const
{
    return m_microStatus;
}

void Left_Main_Widget::setMicroStatus(bool newMicroStatus)
{
    if (m_microStatus == newMicroStatus)
        return;
    m_microStatus = newMicroStatus;
    emit microStatusChanged();
}

void Left_Main_Widget::update_mainBar(int num)
{
    switch(num)
    {
    case 1:
        setChargeStatus(true);
        setSpeedStatus(false);
        setMicroStatus(false);
        setAutoresStatus(false);
        break;
    case 2:
        setChargeStatus(false);
        setSpeedStatus(true);
        setMicroStatus(false);
        setAutoresStatus(false);
        break;
    case 3:
        setChargeStatus(false);
        setSpeedStatus(false);
        setMicroStatus(true);
        setAutoresStatus(false);
        break;
    case 4:
        setChargeStatus(false);
        setSpeedStatus(false);
        setMicroStatus(false);
        setAutoresStatus(true);
        break;
    }

    emit mainBarUpdated();
}

void Left_Main_Widget::update_indicators()
{
    m_left_speed_object->update_dimensions();
}

void Left_Main_Widget::update_selector(int index)
{
    bool allTrue = true;
    for(int i = 0; i < 7; i++) {
        if(m_left_charge_object->getVector_carDoor().at(i) == false) {
            allTrue = false;
            update_select(0);
            setBoolean_selectorSource(true);
            break;
        }
    }

    if (allTrue)
    {
        update_select(index);
        setBoolean_selectorSource(false);
    }

    emit boolean_selectorSourceChanged();
}

void Left_Main_Widget::update_carDoor(int index)
{
    if(getName_selectorSource().at(0) == false)
    {
        m_left_charge_object->setBoolean_carDoor(true);
    }
    else
    {
        m_left_charge_object->update_carDoor(index);
        m_left_charge_object->setBoolean_carDoor(false);
    }

    emit m_left_charge_object->boolean_carDoorChanged();
}

void Left_Main_Widget::update_select(int index_path)
{
    for(int i = 0; i < 5; i++)
    {
        if(index_path == i)
            m_name_selectorSource[i] = true;
        else
            m_name_selectorSource[i] = false;
    }
    emit name_selectorSourceChanged();
}

QVector<bool> Left_Main_Widget::getName_selectorSource() const
{
    return m_name_selectorSource;
}

void Left_Main_Widget::setName_selectorSource(const QVector<bool> &newName_selectorSource)
{
    if (m_name_selectorSource == newName_selectorSource)
        return;
    m_name_selectorSource = newName_selectorSource;
    emit name_selectorSourceChanged();
}

QVector<QString> Left_Main_Widget::getPath_selectorSource() const
{
    return m_path_selectorSource;
}

void Left_Main_Widget::setPath_selectorSource(const QVector<QString> &newPath_selectorSource)
{
    if (m_path_selectorSource == newPath_selectorSource)
        return;
    m_path_selectorSource = newPath_selectorSource;
    emit path_selectorSourceChanged();
}

Left_Charge_Widget *Left_Main_Widget::left_charge_object() const
{
    return m_left_charge_object;
}

bool Left_Main_Widget::getBoolean_selectorSource() const
{
    return m_boolean_selectorSource;
}

void Left_Main_Widget::setBoolean_selectorSource(bool newBoolean_selectorSource)
{
    m_boolean_selectorSource = newBoolean_selectorSource;
}

bool Left_Main_Widget::getAutoresStatus() const
{
    return m_autoresStatus;
}

void Left_Main_Widget::setAutoresStatus(bool newAutoresStatus)
{
    if (m_autoresStatus == newAutoresStatus)
        return;
    m_autoresStatus = newAutoresStatus;
    emit autoresStatusChanged();
}
