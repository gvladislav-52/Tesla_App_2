#include "right_footer_widget.h"

Right_Footer_Widget::Right_Footer_Widget(QObject *parent)
    : QObject{parent}
{
    m_left_Temparate = 15;
    m_right_Temparate = 15;
    m_soundTemp = 5;
    for (int i = 0; i < 8; i++)
        m_bool_temp_button.append(false);
}

int Right_Footer_Widget::getLeft_Temparate() const
{
    return m_left_Temparate;
}

void Right_Footer_Widget::setLeft_Temparate(int newLeft_Temparate)
{
    if (m_left_Temparate == newLeft_Temparate)
        return;
    m_left_Temparate = newLeft_Temparate;
    emit left_TemparateChanged();
}

void Right_Footer_Widget::setLeft_SlotPlus()
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

void Right_Footer_Widget::setLeft_SlotMinus()
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

void Right_Footer_Widget::setRight_SlotPlus()
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

void Right_Footer_Widget::setRight_SlotMinus()
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

int Right_Footer_Widget::getRight_Temparate() const
{
    return m_right_Temparate;
}

void Right_Footer_Widget::setRight_Temparate(int newRight_Temparate)
{
    if (m_right_Temparate == newRight_Temparate)
        return;
    m_right_Temparate = newRight_Temparate;
    emit right_TemparateChanged();
}

int Right_Footer_Widget::soundTemp() const
{
    return m_soundTemp;
}

void Right_Footer_Widget::setSoundTemp(int newSoundTemp)
{
    if (m_soundTemp == newSoundTemp)
        return;
    m_soundTemp = newSoundTemp;
    emit soundTempChanged();
}

void Right_Footer_Widget::setSound_SlotPlus()
{
    if (m_soundTemp < 10)
        m_soundTemp++;
    emit soundTempChanged();
}

void Right_Footer_Widget::setSound_SlotMinus()
{
    if (m_soundTemp > 0)
        m_soundTemp--;
    emit soundTempChanged();
}

QVector<bool> Right_Footer_Widget::getBool_temp_button() const
{
    return m_bool_temp_button;
}

void Right_Footer_Widget::setBool_temp_button(const QVector<bool> &newBool_temp_button)
{
    if (m_bool_temp_button == newBool_temp_button)
        return;
    m_bool_temp_button = newBool_temp_button;
    emit bool_temp_buttonChanged();
}

bool Right_Footer_Widget::muted_music() const
{
    return m_muted_music;
}

void Right_Footer_Widget::setMuted_music(bool newMuted_music)
{
    if (m_muted_music == newMuted_music)
        return;
    m_muted_music = newMuted_music;
    emit muted_musicChanged();
}
