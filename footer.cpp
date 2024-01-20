#include "footer.h"

footer::footer(QObject *parent)
    : QObject{parent}
{
    m_left_Temparate = 15;
    m_right_Temparate = 15;
    m_soundTemp = 0;
}

int footer::left_Temparate() const
{
    return m_left_Temparate;
}

void footer::setleft_Temparate(int newLeft_Temparate)
{
    if (m_left_Temparate == newLeft_Temparate)
        return;
    m_left_Temparate = newLeft_Temparate;
    emit left_TemparateChanged();
}

void footer::setLeft_SlotPlus()
{
    if (m_left_Temparate < 29) {
        m_left_Temparate++;
        if (m_right_Temparate < 29) {
            if ((m_right_Temparate - m_left_Temparate > 4)
                || (m_right_Temparate - m_left_Temparate < -4)) {
                m_right_Temparate++;
                emit right_TemparateChanged();
            }
        }
    }
    emit left_TemparateChanged();
}

void footer::setLeft_SlotMinus()
{
    if (m_left_Temparate > 15) {
        m_left_Temparate--;
        if (m_right_Temparate > 15)
            if ((m_right_Temparate - m_left_Temparate > 4)
                || (m_right_Temparate - m_left_Temparate < -4)) {
                m_right_Temparate--;
                emit right_TemparateChanged();
            }
    }
    emit left_TemparateChanged();
}

void footer::setRight_SlotPlus()
{
    if (m_right_Temparate < 29) {
        m_right_Temparate++;
        if (m_left_Temparate < 29) {
            if ((m_right_Temparate - m_left_Temparate > 4)
                || (m_right_Temparate - m_left_Temparate < -4)) {
                m_left_Temparate++;
                emit left_TemparateChanged();
            }
        }
    }
    emit right_TemparateChanged();
}

void footer::setRight_SlotMinus()
{
    if (m_right_Temparate > 15) {
        m_right_Temparate--;
        if (m_left_Temparate > 15)
            if ((m_right_Temparate - m_left_Temparate > 4)
                || (m_right_Temparate - m_left_Temparate < -4)) {
                m_left_Temparate--;
                emit left_TemparateChanged();
            }
    }
    emit right_TemparateChanged();
}

int footer::right_Temparate() const
{
    return m_right_Temparate;
}

void footer::setright_Temparate(int newRight_Temparate)
{
    if (m_right_Temparate == newRight_Temparate)
        return;
    m_right_Temparate = newRight_Temparate;
    emit right_TemparateChanged();
}

int footer::soundTemp() const
{
    return m_soundTemp;
}

void footer::setSoundTemp(int newSoundTemp)
{
    if (m_soundTemp == newSoundTemp)
        return;
    m_soundTemp = newSoundTemp;
    emit soundTempChanged();
}

void footer::setSound_SlotPlus()
{
    if (m_soundTemp < 20)
        m_soundTemp++;
    emit soundTempChanged();
}

void footer::setSound_SlotMinus()
{
    if (m_soundTemp > 0)
        m_soundTemp--;
    emit soundTempChanged();
}
