#ifndef LEFT_SPEED_WIDGET_H
#define LEFT_SPEED_WIDGET_H

#include <QObject>
#include <QPainter>
#include <QQuickPaintedItem>

class Left_Speed_Widget : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<bool> vector_Indicator READ getVector_Indicator WRITE setVector_Indicator
                   NOTIFY vector_IndicatorChanged FINAL)
    Q_PROPERTY(QVector<QString> vector_Indicator_Path READ getVector_Indicator_Path WRITE
                   setVector_Indicator_Path NOTIFY vector_Indicator_PathChanged FINAL)
    Q_PROPERTY(QString speed_limiter READ getSpeed_limiter WRITE setSpeed_limiter NOTIFY
                   speed_limiterChanged FINAL)
    Q_PROPERTY(QVector<QString> vector_Indicator_Switch READ getVector_Indicator_Switch WRITE
                   setVector_Indicator_Switch NOTIFY vector_Indicator_SwitchChanged FINAL)

public:
    Left_Speed_Widget();
    void update_dimensions();

    void update_speed_limiter();
    QVector<bool> getVector_Indicator() const;
    void setVector_Indicator(const QVector<bool> &newVector_Indicator);
    QVector<QString> getVector_Indicator_Path() const;
    void setVector_Indicator_Path(const QVector<QString> &newVector_Indicator_Path);

    QString getSpeed_limiter() const;
    void setSpeed_limiter(const QString &newSpeed_limiter);

    QVector<QString> getVector_Indicator_Switch() const;
    void setVector_Indicator_Switch(const QVector<QString> &newVector_Indicator_Switch);

signals:
    void vector_IndicatorChanged();
    void vector_Indicator_PathChanged();

    void speed_limiterChanged();

    void vector_Indicator_SwitchChanged();

private:
    QVector<bool> m_vector_Indicator;
    QVector<QString> m_vector_Indicator_Path;
    QVector<QString> path_temp;
    QString m_speed_limiter;
    QVector<QString> m_vector_Indicator_Switch;
};

class Speedometer : public QQuickPaintedItem
{
    Q_OBJECT

    Q_PROPERTY(qreal speedometerSize READ getSpeedometerSize WRITE setSpeedometerSize NOTIFY
                   speedometerSizeChanged FINAL)
    Q_PROPERTY(qreal startAngle READ getStartAngle WRITE setStartAngle NOTIFY startAngleChanged FINAL)
    Q_PROPERTY(qreal alignAngle READ getAlignAngle WRITE setAlignAngle NOTIFY alignAngleChanged FINAL)
    Q_PROPERTY(
        qreal lowestRange READ getLowestRange WRITE setLowestRange NOTIFY lowestRangeChanged FINAL)
    Q_PROPERTY(qreal highestRange READ getHighestRange WRITE setHighestRange NOTIFY
                   highestRangeChanged FINAL)
    Q_PROPERTY(qreal speed READ getSpeed WRITE setSpeed NOTIFY speedChanged FINAL)
    Q_PROPERTY(int arcWidth READ getArcWidth WRITE setArcWidth NOTIFY arcWidthChanged FINAL)
    Q_PROPERTY(
        QColor outerColor READ getOuterColor WRITE setOuterColor NOTIFY outerColorChanged FINAL)

    Q_PROPERTY(QString textSelector READ getTextSelector WRITE setTextSelector NOTIFY
                   textSelectorChanged FINAL)
    Q_PROPERTY(QString textDistance READ getTextDistance WRITE setTextDistance NOTIFY
                   textDistanceChanged FINAL)

public:
    Speedometer(QQuickItem *parent = 0);
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
    int getArcWidth();
    QColor getOuterColor();
    QString getTextSelector();
    QString getTextDistance();

    void setSpeedometerSize(qreal size);
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
#endif // LEFT_SPEED_WIDGET_H
