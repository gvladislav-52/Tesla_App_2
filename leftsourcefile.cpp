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

    //text which shows the value
    painter->save();
    QFont font("Halvetica", 30, QFont::Bold);
    painter->setFont(font);
    pen.setColor(m_TextColor);
    painter->setPen(pen);
    // Вычисляем новые координаты смещения по вертикали
    int verticalOffset = -40; // смещение на 10 единиц вниз
    QRectF adjustedRect = rect.adjusted(m_SpeedometerSize / 30, m_SpeedometerSize / 30 - verticalOffset, -m_SpeedometerSize / 30, -m_SpeedometerSize / 4 - verticalOffset);
    painter->drawText(adjustedRect, Qt::AlignCenter, QString::number((m_Speed / 40), 'f', 1));
    painter->restore();

    //current active process
    painter->save();
    pen.setWidth(m_ArcWidth);
    pen.setColor(m_OuterColor);
    qreal valueToAngle = ((m_Speed - m_LowestRange)/(m_HighestRange - m_LowestRange)) * spanAngle;
    painter->setPen(pen);
    painter->drawArc(rect.adjusted(m_ArcWidth, m_ArcWidth, -m_ArcWidth, -m_ArcWidth),startAngle * 16, valueToAngle * 16);
    painter->restore();

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

QColor leftsourcefile::getTextColor()
{
    return m_TextColor;
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

void leftsourcefile::setTextColor(QColor textColor)
{
    if(m_TextColor == textColor)
        return;

    m_TextColor = textColor;
    emit textColorChanged();
}



