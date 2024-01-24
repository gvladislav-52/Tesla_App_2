#ifndef LEFTSOURCEFILE_H
#define LEFTSOURCEFILE_H

#include <QObject>
#include <QQuickPaintedItem>
#include "setting_source.h"

class LeftSourceFile : public QObject {
    Q_OBJECT
    Q_PROPERTY(setting_source* settingSource READ settingSource CONSTANT)

public:
    explicit LeftSourceFile(QObject *parent = nullptr);

    setting_source* settingSource() const;

private:
    setting_source* m_settingSource;
};

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
    Q_PROPERTY(QVector<bool> indicator_str READ getIndicator_str WRITE setIndicator_str NOTIFY indicator_strChanged FINAL)
    Q_PROPERTY(QVector<QString> indicator_path READ getIndicator_path WRITE setIndicator_path NOTIFY indicator_pathChanged FINAL)

public:
    Indicators();
    void update_dimensions();



    QVector<bool> getIndicator_str() const;
    void setIndicator_str(const QVector<bool> &newIndicator_str);

    QVector<QString> getIndicator_path() const;
    void setIndicator_path(const QVector<QString> &newIndicator_path);

signals:


    void indicator_strChanged();

    void indicator_pathChanged();

private:
    QVector<bool> m_indicator_str;
    QVector<QString> m_indicator_path;
    QVector<QString> path_temp;
};

#endif // LEFTSOURCEFILE_H
