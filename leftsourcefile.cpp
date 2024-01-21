#include "leftsourcefile.h"
#include <QPainter>

leftsourcefile::leftsourcefile(QQuickItem * parent): QQuickPaintedItem(parent),
    m_SpeedometerSize(500),
    m_StartAngle(50),
    m_AlignAngle(260)
{
}

void leftsourcefile::paint(QPainter *painter)
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

void leftsourcefile::updateTahometer(qreal value)
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

void leftsourcefile::updateSpeedometer(qreal &value, bool &direction){
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

void leftsourcefile::updateDistance(qreal value)
{
    qreal distance = ((value / 17.8)/60/60);
    if((full_distance+distance) > 999)
    {
        full_distance=0;
    }
    full_distance += distance;
    setTextDistance(QString::number(full_distance, 'f', 1));
}
qreal leftsourcefile::getSpeedometerSize()
{
    return m_SpeedometerSize;
}

qreal leftsourcefile::getStartAngle()
{
    return m_StartAngle;
}

qreal leftsourcefile::getAlignAngle()
{
    return m_AlignAngle;
}

qreal leftsourcefile::getLowestRange()
{
    return m_LowestRange;
}

qreal leftsourcefile::getHighestRange()
{
    return m_HighestRange;
}

qreal leftsourcefile::getSpeed()
{
    return m_Speed;
}

int leftsourcefile::getArcWidth()
{
    return m_ArcWidth;
}

QColor leftsourcefile::getOuterColor()
{
    return m_OuterColor;
}

QString leftsourcefile::getTextSelector()
{
    return m_textSelector;
}

QString leftsourcefile::getTextDistance()
{
    return m_textDistance;
}

void leftsourcefile::setSpeedometerSize(qreal size)
{
    if(m_SpeedometerSize == size)
        return;

    m_SpeedometerSize = size;
    emit speedometerSizeChanged();      //this will call the qml part
}

void leftsourcefile::setStartAngle(qreal startAngle)
{
    if(m_StartAngle == startAngle)
        return;

    m_StartAngle = startAngle;
    emit startAngleChanged();
}

void leftsourcefile::setAlignAngle(qreal angle)
{
    if(m_StartAngle == angle)
        return;

    m_StartAngle = angle;
    emit alignAngleChanged();
}

void leftsourcefile::setLowestRange(qreal lowestRange)
{
    if(m_LowestRange == lowestRange)
        return;

    m_LowestRange = lowestRange;
    emit lowestRangeChanged();
}

void leftsourcefile::setHighestRange(qreal highestRange)
{
    if(m_HighestRange == highestRange)
        return;

    m_HighestRange = highestRange;
    emit highestRangeChanged();
}

void leftsourcefile::setSpeed(qreal speed)
{
    if(m_Speed == speed)
        return;

    m_Speed = speed;
    update();
    emit speedChanged();
}

void leftsourcefile::setArcWidth(int arcWidth)
{
    if(m_ArcWidth == arcWidth)
        return;

    m_ArcWidth = arcWidth;
    emit arcWidthChanged();
}

void leftsourcefile::setOuterColor(QColor outerColor)
{
    if(m_OuterColor == outerColor)
        return;

    m_OuterColor = outerColor;
    emit outerColorChanged();
}

void leftsourcefile::setTextSelector(QString textSelector)
{
    if(m_textSelector == textSelector)
        return;

    m_textSelector = textSelector;
    emit textSelectorChanged();
}

void leftsourcefile::setTextDistance(QString textDistance)
{
    if(m_textDistance == textDistance)
        return;

    m_textDistance = textDistance;
    emit textDistanceChanged();
}




