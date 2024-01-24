#include "setting_source.h"

setting_source::setting_source() {
    m_name_optical_switch.append("Parking lights");
    m_name_optical_switch.append("External lighting equipment");
    m_name_optical_switch.append("Low beam");
    m_name_optical_switch.append("Fog lights");
    m_name_optical_switch.append("Anti-lock braking system");
    m_name_optical_switch.append("Hand brake");
    m_name_optical_switch.append("Notification system");
    m_name_optical_switch.append("Seat belt warning");
}

QVector<QString> setting_source::getName_optical_switch() const
{
    return m_name_optical_switch;
}

void setting_source::setName_optical_switch(const QVector<QString> &newName_optical_switch)
{
    if (m_name_optical_switch == newName_optical_switch)
        return;
    m_name_optical_switch = newName_optical_switch;
    emit name_optical_switchChanged();
}


