#include "leftsourcefile.h"
#include <QPainter>

// Speedometer::Speedometer(QQuickItem * parent): QQuickPaintedItem(parent),
//     m_SpeedometerSize(500),
//     m_StartAngle(50),
//     m_AlignAngle(260)
// {
// }

// // Indicators::Indicators()
// // {
// //     m_speed_limiter = "40";
// //     for(int i = 0; i < 10; i++)
// //             m_indicator_str.append(true);
// //     for(int i = 0; i < 10; i++)
// //         m_indicator_path.append("1");
// // }

// // void Indicators::update_dimensions()
// // {
// //     path_temp = m_indicator_path;
// //     for(int i = 0; i < m_indicator_str.size(); i++)
// //     {
// //         if(m_indicator_str[i])
// //         {
// //             if (m_indicator_path[i] != "qrc:/ui/optics/optics_" + QString::number(i+1) +"_bw.png")
// //                 m_indicator_path[i] = ("qrc:/ui/optics/optics_" + QString::number(i+1) +"_bw.png");
// //         }
// //         else
// //         {
// //             if (m_indicator_path[i] != "qrc:/ui/optics/optics_" + QString::number(i+1) +".png")
// //                 m_indicator_path[i] = ("qrc:/ui/optics/optics_" + QString::number(i+1) +".png");
// //         }
// //     }

// //     if(path_temp !=m_indicator_path)
// //         emit indicator_pathChanged();
// // }

// // void Indicators::update_speed_limiter()
// // {
// //     int random = rand()%6+1;
// //     if(random == 1)
// //         setSpeed_limiter("20");
// //     else if (random == 2)
// //         setSpeed_limiter("40");
// //     else if (random == 3)
// //         setSpeed_limiter("60");
// //     else if (random == 4)
// //         setSpeed_limiter("90");
// //     else if (random == 5)
// //         setSpeed_limiter("110");
// //     else if (random == 6)
// //         setSpeed_limiter("130");
// //     emit speed_limiterChanged();
// // }

// void Speedometer::paint(QPainter *painter)
// {
//     QRectF rect = this->boundingRect();
//     painter->setRenderHint(QPainter::Antialiasing);
//     QPen pen = painter->pen();
//     pen.setCapStyle(Qt::FlatCap);

//     double startAngle;
//     double spanAngle;

//     startAngle = m_StartAngle - 40;
//     spanAngle = 0 - m_AlignAngle;

//     painter->save();
//     pen.setWidth(m_ArcWidth);
//     pen.setColor(m_OuterColor);
//     qreal valueToAngle = ((m_Speed - m_LowestRange)/(m_HighestRange - m_LowestRange)) * spanAngle;
//     painter->setPen(pen);
//     painter->drawArc(rect.adjusted(m_ArcWidth, m_ArcWidth, -m_ArcWidth, -m_ArcWidth),startAngle * 16, valueToAngle * 16);
//     painter->restore();
// }

// void Speedometer::updateTahometer(qreal value)
// {
//     value = value/17.8;
//     if(value > 210) setTextSelector("6");
//     else if (value > 150) setTextSelector("5");
//     else if (value > 110) setTextSelector("4");
//     else if (value > 70)  setTextSelector("3");
//     else if (value > 30)  setTextSelector("2");
//     else if (value > 0)   setTextSelector("1");
//     else setTextSelector("N");
// }

// void Speedometer::updateSpeedometer(qreal &value, bool &direction){
//     if (value < 1500)
//         setOuterColor(QColor(128,255,0));
//     else if (value > 1500 && value < 3000)
//         setOuterColor(QColor(255,255,0));
//     else if (value > 3000 && value < 4000)
//         setOuterColor(QColor(255,0,0));
//     if(value >= 4450)
//         direction = false;
//     else if (value <= 0.1)
//         direction = true;

//     if(direction)
//         value = value + 10;
//     else
//         value = value - 10;
//     setSpeed(value);
// }

// void Speedometer::updateDistance(qreal value)
// {
//     qreal distance = ((value / 17.8)/60/60);
//     full_distance += distance;
//     setTextDistance(QString::number(full_distance, 'f', 1));
// }

// qreal Speedometer::getSpeedometerSize()
// {
//     return m_SpeedometerSize;
// }

// qreal Speedometer::getStartAngle()
// {
//     return m_StartAngle;
// }

// qreal Speedometer::getAlignAngle()
// {
//     return m_AlignAngle;
// }

// qreal Speedometer::getLowestRange()
// {
//     return m_LowestRange;
// }

// qreal Speedometer::getHighestRange()
// {
//     return m_HighestRange;
// }

// qreal Speedometer::getSpeed()
// {
//     return m_Speed;
// }

// int Speedometer::getArcWidth()
// {
//     return m_ArcWidth;
// }

// QColor Speedometer::getOuterColor()
// {
//     return m_OuterColor;
// }

// QString Speedometer::getTextSelector()
// {
//     return m_textSelector;
// }

// QString Speedometer::getTextDistance()
// {
//     return m_textDistance;
// }

// void Speedometer::setSpeedometerSize(qreal size)
// {
//     if(m_SpeedometerSize == size)
//         return;

//     m_SpeedometerSize = size;
//     emit speedometerSizeChanged();      //this will call the qml part
// }

// void Speedometer::setStartAngle(qreal startAngle)
// {
//     if(m_StartAngle == startAngle)
//         return;

//     m_StartAngle = startAngle;
//     emit startAngleChanged();
// }

// void Speedometer::setAlignAngle(qreal angle)
// {
//     if(m_StartAngle == angle)
//         return;

//     m_StartAngle = angle;
//     emit alignAngleChanged();
// }

// void Speedometer::setLowestRange(qreal lowestRange)
// {
//     if(m_LowestRange == lowestRange)
//         return;

//     m_LowestRange = lowestRange;
//     emit lowestRangeChanged();
// }

// void Speedometer::setHighestRange(qreal highestRange)
// {
//     if(m_HighestRange == highestRange)
//         return;

//     m_HighestRange = highestRange;
//     emit highestRangeChanged();
// }

// void Speedometer::setSpeed(qreal speed)
// {
//     if(m_Speed == speed)
//         return;

//     m_Speed = speed;
//     update();
//     emit speedChanged();
// }

// void Speedometer::setArcWidth(int arcWidth)
// {
//     if(m_ArcWidth == arcWidth)
//         return;

//     m_ArcWidth = arcWidth;
//     emit arcWidthChanged();
// }

// void Speedometer::setOuterColor(QColor outerColor)
// {
//     if(m_OuterColor == outerColor)
//         return;

//     m_OuterColor = outerColor;
//     emit outerColorChanged();
// }

// void Speedometer::setTextSelector(QString textSelector)
// {
//     if(m_textSelector == textSelector)
//         return;

//     m_textSelector = textSelector;
//     emit textSelectorChanged();
// }

// void Speedometer::setTextDistance(QString textDistance)
// {
//     if(m_textDistance == textDistance)
//         return;

//     m_textDistance = textDistance;
//     emit textDistanceChanged();
// }


// QVector<bool> Indicators::getIndicator_str() const
// {
//     return m_indicator_str;
// }

// void Indicators::setIndicator_str(const QVector<bool> &newIndicator_str)
// {
//     if (m_indicator_str == newIndicator_str)
//         return;
//     m_indicator_str = newIndicator_str;
//     emit indicator_strChanged();
// }

// QVector<QString> Indicators::getIndicator_path() const
// {
//     return m_indicator_path;
// }

// void Indicators::setIndicator_path(const QVector<QString> &newIndicator_path)
// {
//     if (m_indicator_path == newIndicator_path)
//         return;
//     m_indicator_path = newIndicator_path;
//     emit indicator_pathChanged();
// }

LeftSourceFile::LeftSourceFile(QObject *parent) : QObject(parent) {
    m_chargeStatus = true;
    m_speedStatus = false;
    m_microStatus = false;

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

// setting_source* LeftSourceFile::settingSource() const {
//     return m_settingSource;
// }


Left_Speed_Widget *LeftSourceFile::left_speed_object() const
{
    return m_left_speed_object;
}

//setting_source::setting_source() {
//     m_name_optical_switch.append("Parking lights");
//     m_name_optical_switch.append("External lighting equipment");
//     m_name_optical_switch.append("Low beam");
//     m_name_optical_switch.append("Fog lights");
//     m_name_optical_switch.append("Anti-lock braking system");
//     m_name_optical_switch.append("Hand brake");
//     m_name_optical_switch.append("Notification system");
//     m_name_optical_switch.append("Seat belt warning");
//     m_name_optical_switch.append("Turn signal right");
//     m_name_optical_switch.append("Turn signal left");
// }

// QVector<QString> setting_source::getName_optical_switch() const
// {
//     return m_name_optical_switch;
// }

// void setting_source::setName_optical_switch(const QVector<QString> &newName_optical_switch)
// {
//     if (m_name_optical_switch == newName_optical_switch)
//         return;
//     m_name_optical_switch = newName_optical_switch;
//     emit name_optical_switchChanged();
// }

bool LeftSourceFile::getChargeStatus() const
{
    return m_chargeStatus;
}

void LeftSourceFile::setChargeStatus(bool newChargeStatus)
{
    if (m_chargeStatus == newChargeStatus)
        return;
    m_chargeStatus = newChargeStatus;
    emit chargeStatusChanged();
}

bool LeftSourceFile::getSpeedStatus() const
{
    return m_speedStatus;
}

void LeftSourceFile::setSpeedStatus(bool newSpeedStatus)
{
    if (m_speedStatus == newSpeedStatus)
        return;
    m_speedStatus = newSpeedStatus;
    emit speedStatusChanged();
}

bool LeftSourceFile::getMicroStatus() const
{
    return m_microStatus;
}

void LeftSourceFile::setMicroStatus(bool newMicroStatus)
{
    if (m_microStatus == newMicroStatus)
        return;
    m_microStatus = newMicroStatus;
    emit microStatusChanged();
}

void LeftSourceFile::update_mainBar(int num)
{
    if(num == 1)
    {
        setChargeStatus(true);
        setSpeedStatus(false);
        setMicroStatus(false);
    }
    else if (num == 2) {
        setChargeStatus(false);
        setSpeedStatus(true);
        setMicroStatus(false);
    }
    else if (num == 3) {
        setChargeStatus(false);
        setSpeedStatus(false);
        setMicroStatus(true);
    }
    emit mainBarUpdated();
}

void LeftSourceFile::update_indicators()
{
    m_left_speed_object->update_dimensions();
}

void LeftSourceFile::update_selector(int index)
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

void LeftSourceFile::update_carDoor(int index)
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

// QString Indicators::getSpeed_limiter() const
// {
//     return m_speed_limiter;
// }

// void Indicators::setSpeed_limiter(const QString &newSpeed_limiter)
// {
//     if (m_speed_limiter == newSpeed_limiter)
//         return;
//     m_speed_limiter = newSpeed_limiter;
//     emit speed_limiterChanged();
// }

// QString LeftSourceFile::getBattarySource() const
// {
//     return m_battarySource;
// }

// void LeftSourceFile::setBattarySource(const QString &newBattarySource)
// {
//     if (m_battarySource == newBattarySource)
//         return;
//     m_battarySource = newBattarySource;
//     emit battarySourceChanged();
// }

// void LeftSourceFile::update_battery()
// {
//     if(battery_temp >= 0)
//         setBattarySource(QString::number(battery_temp--));
// }

// Selector::Selector()
// {
//     for(int i = 0; i < 5; i++)
//     {
//         m_path_selectorSource.append("qrc:/ui/selector_button/selector_num_"+QString::number(i+1)+".png");
//         m_name_selectorSource.append(false);
//     }
//         m_name_selectorSource[0] = true;

// }

void LeftSourceFile::update_select(int index_path)
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

QVector<bool> LeftSourceFile::getName_selectorSource() const
{
    return m_name_selectorSource;
}

void LeftSourceFile::setName_selectorSource(const QVector<bool> &newName_selectorSource)
{
    if (m_name_selectorSource == newName_selectorSource)
        return;
    m_name_selectorSource = newName_selectorSource;
    emit name_selectorSourceChanged();
}

QVector<QString> LeftSourceFile::getPath_selectorSource() const
{
    return m_path_selectorSource;
}

void LeftSourceFile::setPath_selectorSource(const QVector<QString> &newPath_selectorSource)
{
    if (m_path_selectorSource == newPath_selectorSource)
        return;
    m_path_selectorSource = newPath_selectorSource;
    emit path_selectorSourceChanged();
}

// CarDoor::CarDoor()
// {
//     for(int i = 0; i<7; i++)
//         m_name_carDoor.append(true);
// }

// QVector<bool> CarDoor::getName_carDoor() const
// {
//     return m_name_carDoor;
// }

// void CarDoor::setName_carDoor(const QVector<bool> &newName_carDoor)
// {
//     if (m_name_carDoor == newName_carDoor)
//         return;
//     m_name_carDoor = newName_carDoor;
//     emit name_carDoorChanged();
// }

// void CarDoor::update_carDoor(int index)
// {
//     m_name_carDoor[index] = !m_name_carDoor[index];
//     emit name_carDoorChanged();
// }

Left_Charge_Widget *LeftSourceFile::left_charge_object() const
{
    return m_left_charge_object;
}

// bool CarDoor::getBoolean_carDoor() const
// {
//     return m_boolean_carDoor;
// }

// void CarDoor::setBoolean_carDoor(bool newBoolean_carDoor)
// {
//     if (m_boolean_carDoor == newBoolean_carDoor)
//         return;
//     m_boolean_carDoor = newBoolean_carDoor;
//     emit boolean_carDoorChanged();
// }

bool LeftSourceFile::getBoolean_selectorSource() const
{
    return m_boolean_selectorSource;
}

void LeftSourceFile::setBoolean_selectorSource(bool newBoolean_selectorSource)
{
    m_boolean_selectorSource = newBoolean_selectorSource;
}
