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
    for(int i = 0; i < 8; i++)
            m_indicator_str.append(true);
    for(int i = 0; i < 8; i++)
        m_indicator_path.append("1");
}

void Indicators::update_dimensions()
{
    path_temp = m_indicator_path;
    for(int i = 0; i < m_indicator_str.size(); i++)
    {
        if(m_indicator_str[i])
        {
            if (m_indicator_path[i] != "qrc:/ui/optics/optics_" + QString::number(i+1) +"_bw.png")
                m_indicator_path[i] = ("qrc:/ui/optics/optics_" + QString::number(i+1) +"_bw.png");
        }
        else
        {
            if (m_indicator_path[i] != "qrc:/ui/optics/optics_" + QString::number(i+1) +".png")
                m_indicator_path[i] = ("qrc:/ui/optics/optics_" + QString::number(i+1) +".png");
        }
    }

    if(path_temp !=m_indicator_path)
        emit indicator_pathChanged();
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


QVector<bool> Indicators::getIndicator_str() const
{
    return m_indicator_str;
}

void Indicators::setIndicator_str(const QVector<bool> &newIndicator_str)
{
    if (m_indicator_str == newIndicator_str)
        return;
    m_indicator_str = newIndicator_str;
    emit indicator_strChanged();
}

QVector<QString> Indicators::getIndicator_path() const
{
    return m_indicator_path;
}

void Indicators::setIndicator_path(const QVector<QString> &newIndicator_path)
{
    if (m_indicator_path == newIndicator_path)
        return;
    m_indicator_path = newIndicator_path;
    emit indicator_pathChanged();
}

LeftSourceFile::LeftSourceFile(QObject *parent) : QObject(parent) {
    m_settingSource = new setting_source();
}

setting_source* LeftSourceFile::settingSource() const {
    return m_settingSource;
}
