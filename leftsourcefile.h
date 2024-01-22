#ifndef LEFTSOURCEFILE_H
#define LEFTSOURCEFILE_H

#include <QObject>
#include <QQuickPaintedItem>

class Speedometer: public QQuickPaintedItem
{
    Q_OBJECT

    Q_PROPERTY(qreal speedometerSize READ getSpeedometerSize WRITE setSpeedometerSize NOTIFY speedometerSizeChanged FINAL)
    Q_PROPERTY(qreal startAngle READ getStartAngle WRITE setStartAngle NOTIFY startAngleChanged FINAL)
    Q_PROPERTY(qreal alignAngle READ getAlignAngle WRITE setAlignAngle NOTIFY alignAngleChanged FINAL)
    Q_PROPERTY(qreal lowestRange READ getLowestRange WRITE setLowestRange NOTIFY lowestRangeChanged FINAL)
    Q_PROPERTY(qreal highestRange READ getHighestRange WRITE setHighestRange NOTIFY highestRangeChanged FINAL)
    Q_PROPERTY(qreal speed READ getSpeed WRITE setSpeed NOTIFY speedChanged FINAL)
    Q_PROPERTY(int arcWidth READ getArcWidth WRITE setArcWidth NOTIFY arcWidthChanged FINAL)
    Q_PROPERTY(QColor outerColor READ getOuterColor WRITE setOuterColor NOTIFY outerColorChanged FINAL)

    Q_PROPERTY(QString textSelector READ getTextSelector WRITE setTextSelector NOTIFY textSelectorChanged FINAL)
    Q_PROPERTY(QString textDistance READ getTextDistance WRITE setTextDistance NOTIFY textDistanceChanged FINAL)

public:
    Speedometer(QQuickItem * parent = 0);
    virtual void paint(QPainter *painter);
    void updateTahometer(qreal value);
    void updateSpeedometer(qreal &value, bool &direction);
    void updateDistance(qreal value);

    qreal getSpeedometerSize();
    qreal getStartAngle();
    qreal getAlignAngle();
    qreal getLowestRange();
    qreal getHighestRange();
    qreal getSpeed();
    int   getArcWidth();
    QColor getOuterColor();
    QString getTextSelector();
    QString getTextDistance();

    void  setSpeedometerSize(qreal size);
    void setStartAngle(qreal startAngle);
    void setAlignAngle(qreal angle);
    void setLowestRange(qreal lowestRange);
    void setHighestRange(qreal highestRange);
    void setSpeed(qreal speed);
    void setArcWidth(int arcWidth);
    void setOuterColor(QColor outerColor);
    void setTextSelector(QString textSelector);
    void setTextDistance(QString textDistance);

signals:
    void speedometerSizeChanged();
    void startAngleChanged();
    void alignAngleChanged();
    void lowestRangeChanged();
    void highestRangeChanged();
    void speedChanged();
    void arcWidthChanged();
    void outerColorChanged();
    void textSelectorChanged();
    void textDistanceChanged();

private:
    qreal m_SpeedometerSize;
    qreal m_StartAngle;
    qreal m_AlignAngle;
    qreal m_LowestRange;
    qreal m_HighestRange;
    qreal m_Speed;
    int m_ArcWidth;
    QColor m_OuterColor;
    QString m_textSelector;
    QString m_textDistance;
    qreal full_distance;
};

class Indicators: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString indicator_dimensions READ getIndicator_dimensions WRITE setIndicator_dimensions NOTIFY indicator_dimensionsChanged FINAL)
    Q_PROPERTY(QString  indicator_external_light READ getIndicator_external_light WRITE setIndicator_external_light NOTIFY indicator_external_lightChanged FINAL)
    Q_PROPERTY(QString indicator_low_beam READ getIndicator_low_beam WRITE setIndicator_low_beam NOTIFY indicator_low_beamChanged FINAL)
    Q_PROPERTY(QString indicator_fog_light READ getIndicator_fog_light WRITE setIndicator_fog_light NOTIFY indicator_fog_lightChanged FINAL)
    Q_PROPERTY(QString indicator_abs READ getIndicator_abs WRITE setIndicator_abs NOTIFY indicator_absChanged FINAL)
    Q_PROPERTY(QString indicator_handbrake READ getIndicator_handbrake WRITE setIndicator_handbrake NOTIFY indicator_handbrakeChanged FINAL)
    Q_PROPERTY(QString indicator_check READ getIndicator_check WRITE setIndicator_check NOTIFY indicator_checkChanged FINAL)
    Q_PROPERTY(QString indicator_belt READ getIndicator_belt WRITE setIndicator_belt NOTIFY indicator_beltChanged FINAL)

public:
    Indicators();
    void update_dimensions(bool &emp);
    QString getIndicator_dimensions();
    QString getIndicator_external_light();
    QString getIndicator_low_beam();
    QString getIndicator_fog_light();
    QString getIndicator_abs();
    QString getIndicator_handbrake();
    QString getIndicator_check();
    QString getIndicator_belt();

    void setIndicator_dimensions(QString dimensions);
    void setIndicator_external_light(QString external_light);
    void setIndicator_low_beam(QString low_beam);
    void setIndicator_fog_light(QString fog_light);
    void setIndicator_abs(QString abs);
    void setIndicator_handbrake(QString handbrake);
    void setIndicator_check(QString check);
    void setIndicator_belt(QString belt);

signals:
    void indicator_dimensionsChanged();
    void indicator_external_lightChanged();
    void indicator_low_beamChanged();
    void indicator_fog_lightChanged();
    void indicator_absChanged();
    void indicator_handbrakeChanged();
    void indicator_checkChanged();
    void indicator_beltChanged();

private:
    QString m_dimensions;
    QString m_external_light;
    QString m_low_beam;
    QString m_fog_light;
    QString m_abs;
    QString m_handbrake;
    QString m_check;
    QString m_belt;
};

#endif // LEFTSOURCEFILE_H
