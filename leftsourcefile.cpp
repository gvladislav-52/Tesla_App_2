#include "leftsourcefile.h"
#include <QPainter>

Speedometer::Speedometer(QQuickItem * parent): QQuickPaintedItem(parent),
    m_SpeedometerSize(500),
    m_StartAngle(50),
    m_AlignAngle(260)
{
}

Indicators::Indicators()
{
}

void Indicators::update_dimensions(bool &temp)
{
    temp = !temp;
    if(temp)
    {
        setIndicator_dimensions("qrc:/ui/optics/optics_1_bw.png");
        setIndicator_external_light("qrc:/ui/optics/optics_2_bw.png");
        setIndicator_low_beam("qrc:/ui/optics/optics_3_bw.png");
        setIndicator_fog_light("qrc:/ui/optics/optics_4.png");
        setIndicator_abs("qrc:/ui/optics/optics_5.png");
        setIndicator_handbrake("qrc:/ui/optics/optics_6.png");
        setIndicator_check("qrc:/ui/optics/optics_7.png");
        setIndicator_belt("qrc:/ui/optics/optics_8_bw.png");
    }
    else
    {
        setIndicator_dimensions("qrc:/ui/optics/optics_1.png");
        setIndicator_external_light("qrc:/ui/optics/optics_2.png");
        setIndicator_low_beam("qrc:/ui/optics/optics_3.png");
        setIndicator_fog_light("qrc:/ui/optics/optics_4_bw.png");
        setIndicator_abs("qrc:/ui/optics/optics_5_bw.png");
        setIndicator_handbrake("qrc:/ui/optics/optics_6_bw.png");
        setIndicator_check("qrc:/ui/optics/optics_7_bw.png");
        setIndicator_belt("qrc:/ui/optics/optics_8.png");
    }

}

void Speedometer::paint(QPainter *painter)
{
    QRectF rect = this->boundingRect();
    painter->setRenderHint(QPainter::Antialiasing);
    QPen pen = painter->pen();
    pen.setCapStyle(Qt::FlatCap);

    double startAngle;
    double spanAngle;

    startAngle = m_StartAngle - 40;
    spanAngle = 0 - m_AlignAngle;

    painter->save();
    pen.setWidth(m_ArcWidth);
    pen.setColor(m_OuterColor);
    qreal valueToAngle = ((m_Speed - m_LowestRange)/(m_HighestRange - m_LowestRange)) * spanAngle;
    painter->setPen(pen);
    painter->drawArc(rect.adjusted(m_ArcWidth, m_ArcWidth, -m_ArcWidth, -m_ArcWidth),startAngle * 16, valueToAngle * 16);
    painter->restore();
}

void Speedometer::updateTahometer(qreal value)
{
    value = value/17.8;
    if(value > 210) setTextSelector("6");
    else if (value > 150) setTextSelector("5");
    else if (value > 110) setTextSelector("4");
    else if (value > 70)  setTextSelector("3");
    else if (value > 30)  setTextSelector("2");
    else if (value > 0)   setTextSelector("1");
    else setTextSelector("N");
}

void Speedometer::updateSpeedometer(qreal &value, bool &direction){
    if (value < 1500)
        setOuterColor(QColor(128,255,0));
    else if (value > 1500 && value < 3000)
        setOuterColor(QColor(255,255,0));
    else if (value > 3000 && value < 4000)
        setOuterColor(QColor(255,0,0));
    if(value >= 4450)
        direction = false;
    else if (value <= 0.1)
        direction = true;

    if(direction)
        value = value + 10;
    else
        value = value - 10;
    setSpeed(value);
}

void Speedometer::updateDistance(qreal value)
{
    qreal distance = ((value / 17.8)/60/60);
    full_distance += distance;
    setTextDistance(QString::number(full_distance, 'f', 1));
}
qreal Speedometer::getSpeedometerSize()
{
    return m_SpeedometerSize;
}

qreal Speedometer::getStartAngle()
{
    return m_StartAngle;
}

qreal Speedometer::getAlignAngle()
{
    return m_AlignAngle;
}

qreal Speedometer::getLowestRange()
{
    return m_LowestRange;
}

qreal Speedometer::getHighestRange()
{
    return m_HighestRange;
}

qreal Speedometer::getSpeed()
{
    return m_Speed;
}

int Speedometer::getArcWidth()
{
    return m_ArcWidth;
}

QColor Speedometer::getOuterColor()
{
    return m_OuterColor;
}

QString Speedometer::getTextSelector()
{
    return m_textSelector;
}

QString Speedometer::getTextDistance()
{
    return m_textDistance;
}

QString Indicators::getIndicator_dimensions()
{
    return m_dimensions;
}

QString Indicators::getIndicator_external_light()
{
    return m_external_light;
}

QString Indicators::getIndicator_low_beam()
{
    return m_low_beam;
}

QString Indicators::getIndicator_fog_light()
{
    return m_fog_light;
}

QString Indicators::getIndicator_abs()
{
    return m_abs;
}

QString Indicators::getIndicator_handbrake()
{
    return m_handbrake;
}

QString Indicators::getIndicator_check()
{
    return m_check;
}

QString Indicators::getIndicator_belt()
{
    return m_belt;
}

void Speedometer::setSpeedometerSize(qreal size)
{
    if(m_SpeedometerSize == size)
        return;

    m_SpeedometerSize = size;
    emit speedometerSizeChanged();      //this will call the qml part
}

void Speedometer::setStartAngle(qreal startAngle)
{
    if(m_StartAngle == startAngle)
        return;

    m_StartAngle = startAngle;
    emit startAngleChanged();
}

void Speedometer::setAlignAngle(qreal angle)
{
    if(m_StartAngle == angle)
        return;

    m_StartAngle = angle;
    emit alignAngleChanged();
}

void Speedometer::setLowestRange(qreal lowestRange)
{
    if(m_LowestRange == lowestRange)
        return;

    m_LowestRange = lowestRange;
    emit lowestRangeChanged();
}

void Speedometer::setHighestRange(qreal highestRange)
{
    if(m_HighestRange == highestRange)
        return;

    m_HighestRange = highestRange;
    emit highestRangeChanged();
}

void Speedometer::setSpeed(qreal speed)
{
    if(m_Speed == speed)
        return;

    m_Speed = speed;
    update();
    emit speedChanged();
}

void Speedometer::setArcWidth(int arcWidth)
{
    if(m_ArcWidth == arcWidth)
        return;

    m_ArcWidth = arcWidth;
    emit arcWidthChanged();
}

void Speedometer::setOuterColor(QColor outerColor)
{
    if(m_OuterColor == outerColor)
        return;

    m_OuterColor = outerColor;
    emit outerColorChanged();
}

void Speedometer::setTextSelector(QString textSelector)
{
    if(m_textSelector == textSelector)
        return;

    m_textSelector = textSelector;
    emit textSelectorChanged();
}

void Speedometer::setTextDistance(QString textDistance)
{
    if(m_textDistance == textDistance)
        return;

    m_textDistance = textDistance;
    emit textDistanceChanged();
}

void Indicators::setIndicator_dimensions(QString dimensions)
{
    if(m_dimensions == dimensions)
        return;

    m_dimensions = dimensions;
    emit indicator_dimensionsChanged();
}

void Indicators::setIndicator_external_light(QString external_light)
{
    if(m_external_light == external_light)
        return;

    m_external_light = external_light;
    emit indicator_external_lightChanged();
}

void Indicators::setIndicator_low_beam(QString low_beam)
{
    if(m_low_beam == low_beam)
        return;

    m_low_beam = low_beam;
    emit indicator_low_beamChanged();
}

void Indicators::setIndicator_fog_light(QString fog_light)
{
    if(m_fog_light == fog_light)
        return;

    m_fog_light = fog_light;
    emit indicator_fog_lightChanged();
}

void Indicators::setIndicator_abs(QString abs)
{
    if(m_abs == abs)
        return;

    m_abs = abs;
    emit indicator_absChanged();
}

void Indicators::setIndicator_handbrake(QString handbrake)
{
    if(m_handbrake == handbrake)
        return;

    m_handbrake = handbrake;
    emit indicator_handbrakeChanged();
}

void Indicators::setIndicator_check(QString check)
{
    if(m_check == check)
        return;

    m_check = check;
    emit indicator_checkChanged();
}

void Indicators::setIndicator_belt(QString belt)
{
    if(m_belt == belt)
        return;

    m_belt = belt;
    emit indicator_beltChanged();
}







