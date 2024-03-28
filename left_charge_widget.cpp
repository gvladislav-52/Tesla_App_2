#include "left_charge_widget.h"

Left_Charge_Widget::Left_Charge_Widget()
{
    for (int i = 0; i < 7; i++)
        m_vector_carDoor.append(true);
    m_battary_path = "qrc:/ui/battery/battery.png";
}

QVector<bool> Left_Charge_Widget::getVector_carDoor() const
{
    return m_vector_carDoor;
}

void Left_Charge_Widget::setVector_carDoor(const QVector<bool> &newVector_carDoor)
{
    if (m_vector_carDoor == newVector_carDoor)
        return;
    m_vector_carDoor = newVector_carDoor;
    emit vector_carDoorChanged();
}

bool Left_Charge_Widget::getBoolean_carDoor() const
{
    return m_boolean_carDoor;
}

void Left_Charge_Widget::setBoolean_carDoor(bool newBoolean_carDoor)
{
    if (m_boolean_carDoor == newBoolean_carDoor)
        return;
    m_boolean_carDoor = newBoolean_carDoor;
    emit boolean_carDoorChanged();
}

void Left_Charge_Widget::update_carDoor(int index)
{
    m_vector_carDoor[index] = !m_vector_carDoor[index];
    emit vector_carDoorChanged();
}

QString Left_Charge_Widget::getBattarySource() const
{
    return m_battarySource;
}

void Left_Charge_Widget::setBattarySource(const QString &newBattarySource)
{
    if (m_battarySource == newBattarySource)
        return;
    m_battarySource = newBattarySource;
    emit battarySourceChanged();
}

void Left_Charge_Widget::update_battery()
{
    if (battery_temp >= 0)
        setBattarySource(QString::number(battery_temp--));

    switch (battery_temp) {
    case 74:
        setBattary_path("qrc:/ui/battery/battery_2.png");
        emit battary_pathChanged();
        break;
    case 59:
        setBattary_path("qrc:/ui/battery/battery_3.png");
        emit battary_pathChanged();
        break;
    case 34:
        setBattary_path("qrc:/ui/battery/battery_4.png");
        emit battary_pathChanged();
        break;
    case 19:
        setBattary_path("qrc:/ui/battery/battery_5.png");
        emit battary_pathChanged();
        break;
    case 0:
        setBattary_path("qrc:/ui/battery/battery_6.png");
        emit battary_pathChanged();
        break;
    }
}

QString Left_Charge_Widget::getBattary_path() const
{
    return m_battary_path;
}

void Left_Charge_Widget::setBattary_path(const QString &newBattary_path)
{
    if (m_battary_path == newBattary_path)
        return;
    m_battary_path = newBattary_path;
    emit battary_pathChanged();
}
