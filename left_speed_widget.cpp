#include "left_speed_widget.h"

//////////////////////////////////////////////////////////////////////////[Left_Speeed_Widget]///////////////////////////////////////////////////////////////////////

Left_Speed_Widget::Left_Speed_Widget()
{
    //m_speed_limiter = "40";
    for(int i = 0; i < 10; i++)
        m_vector_Indicator.append(true);
    for(int i = 0; i < 10; i++)
        m_vector_Indicator_Path.append("1");

    m_vector_Indicator_Switch.append("Parking lights");
    m_vector_Indicator_Switch.append("External lighting equipment");
    m_vector_Indicator_Switch.append("Low beam");
    m_vector_Indicator_Switch.append("Fog lights");
    m_vector_Indicator_Switch.append("Anti-lock braking system");
    m_vector_Indicator_Switch.append("Hand brake");
    m_vector_Indicator_Switch.append("Notification system");
    m_vector_Indicator_Switch.append("Seat belt warning");
    m_vector_Indicator_Switch.append("Turn signal right");
    m_vector_Indicator_Switch.append("Turn signal left");
}

QVector<bool> Left_Speed_Widget::getVector_Indicator() const
{
    return m_vector_Indicator;
}

void Left_Speed_Widget::setVector_Indicator(const QVector<bool> &newVector_Indicator)
{
    if (m_vector_Indicator == newVector_Indicator)
        return;
    m_vector_Indicator = newVector_Indicator;
    emit vector_IndicatorChanged();
}

QVector<QString> Left_Speed_Widget::getVector_Indicator_Path() const
{
    return m_vector_Indicator_Path;
}

void Left_Speed_Widget::setVector_Indicator_Path(const QVector<QString> &newVector_Indicator_Path)
{
    if (m_vector_Indicator_Path == newVector_Indicator_Path)
        return;
    m_vector_Indicator_Path = newVector_Indicator_Path;
    emit vector_Indicator_PathChanged();
}

void Left_Speed_Widget::update_dimensions()
{
    path_temp = m_vector_Indicator_Path;
    for(int i = 0; i < m_vector_Indicator.size(); i++)
    {
        if(m_vector_Indicator[i])
        {
            if (m_vector_Indicator_Path[i] != "qrc:/ui/optics/optics_" + QString::number(i+1) +"_bw.png")
                m_vector_Indicator_Path[i] = ("qrc:/ui/optics/optics_" + QString::number(i+1) +"_bw.png");
        }
        else
        {
            if (m_vector_Indicator_Path[i] != "qrc:/ui/optics/optics_" + QString::number(i+1) +".png")
                m_vector_Indicator_Path[i] = ("qrc:/ui/optics/optics_" + QString::number(i+1) +".png");
        }
    }

    if(path_temp !=m_vector_Indicator_Path)
        emit vector_Indicator_PathChanged();
}

void Left_Speed_Widget::update_speed_limiter()
{
    int random = rand()%6+1;
    if(random == 1)
        setSpeed_limiter("20");
    else if (random == 2)
        setSpeed_limiter("40");
    else if (random == 3)
        setSpeed_limiter("60");
    else if (random == 4)
        setSpeed_limiter("90");
    else if (random == 5)
        setSpeed_limiter("110");
    else if (random == 6)
        setSpeed_limiter("130");
    emit speed_limiterChanged();
}


QString Left_Speed_Widget::getSpeed_limiter() const
{
    return m_speed_limiter;
}

void Left_Speed_Widget::setSpeed_limiter(const QString &newSpeed_limiter)
{
    if (m_speed_limiter == newSpeed_limiter)
        return;
    m_speed_limiter = newSpeed_limiter;
    emit speed_limiterChanged();
}

QVector<QString> Left_Speed_Widget::getVector_Indicator_Switch() const
{
    return m_vector_Indicator_Switch;
}

void Left_Speed_Widget::setVector_Indicator_Switch(const QVector<QString> &newVector_Indicator_Switch)
{
    if (m_vector_Indicator_Switch == newVector_Indicator_Switch)
        return;
    m_vector_Indicator_Switch = newVector_Indicator_Switch;
    emit vector_Indicator_SwitchChanged();
}

//////////////////////////////////////////////////////////////////////////[~Left_Speeed_Widget]//////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////[SPEEDOMETER]///////////////////////////////////////////////////////////////////////

Speedometer::Speedometer(QQuickItem * parent): QQuickPaintedItem(parent),
    m_SpeedometerSize(500),
    m_StartAngle(50),
    m_AlignAngle(260)
{
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

////////////////////////////////////////////////////////////////////////////////[~SPEEDOMETER]//////////////////////////////////////////////////////////////////////

