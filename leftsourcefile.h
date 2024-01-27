#ifndef LEFTSOURCEFILE_H
#define LEFTSOURCEFILE_H

#include <QObject>
#include "left_charge_widget.h"
#include "left_speed_widget.h"

// class Speedometer: public QQuickPaintedItem
// {
//     Q_OBJECT

//     Q_PROPERTY(qreal speedometerSize READ getSpeedometerSize WRITE setSpeedometerSize NOTIFY speedometerSizeChanged FINAL)
//     Q_PROPERTY(qreal startAngle READ getStartAngle WRITE setStartAngle NOTIFY startAngleChanged FINAL)
//     Q_PROPERTY(qreal alignAngle READ getAlignAngle WRITE setAlignAngle NOTIFY alignAngleChanged FINAL)
//     Q_PROPERTY(qreal lowestRange READ getLowestRange WRITE setLowestRange NOTIFY lowestRangeChanged FINAL)
//     Q_PROPERTY(qreal highestRange READ getHighestRange WRITE setHighestRange NOTIFY highestRangeChanged FINAL)
//     Q_PROPERTY(qreal speed READ getSpeed WRITE setSpeed NOTIFY speedChanged FINAL)
//     Q_PROPERTY(int arcWidth READ getArcWidth WRITE setArcWidth NOTIFY arcWidthChanged FINAL)
//     Q_PROPERTY(QColor outerColor READ getOuterColor WRITE setOuterColor NOTIFY outerColorChanged FINAL)

//     Q_PROPERTY(QString textSelector READ getTextSelector WRITE setTextSelector NOTIFY textSelectorChanged FINAL)
//     Q_PROPERTY(QString textDistance READ getTextDistance WRITE setTextDistance NOTIFY textDistanceChanged FINAL)

// public:
//     Speedometer(QQuickItem * parent = 0);
//     virtual void paint(QPainter *painter);
//     void updateTahometer(qreal value);
//     void updateSpeedometer(qreal &value, bool &direction);
//     void updateDistance(qreal value);

//     qreal getSpeedometerSize();
//     qreal getStartAngle();
//     qreal getAlignAngle();
//     qreal getLowestRange();
//     qreal getHighestRange();
//     qreal getSpeed();
//     int   getArcWidth();
//     QColor getOuterColor();
//     QString getTextSelector();
//     QString getTextDistance();

//     void  setSpeedometerSize(qreal size);
//     void setStartAngle(qreal startAngle);
//     void setAlignAngle(qreal angle);
//     void setLowestRange(qreal lowestRange);
//     void setHighestRange(qreal highestRange);
//     void setSpeed(qreal speed);
//     void setArcWidth(int arcWidth);
//     void setOuterColor(QColor outerColor);
//     void setTextSelector(QString textSelector);
//     void setTextDistance(QString textDistance);

// signals:
//     void speedometerSizeChanged();
//     void startAngleChanged();
//     void alignAngleChanged();
//     void lowestRangeChanged();
//     void highestRangeChanged();
//     void speedChanged();
//     void arcWidthChanged();
//     void outerColorChanged();
//     void textSelectorChanged();
//     void textDistanceChanged();

// private:
//     qreal m_SpeedometerSize;
//     qreal m_StartAngle;
//     qreal m_AlignAngle;
//     qreal m_LowestRange;
//     qreal m_HighestRange;
//     qreal m_Speed;
//     int m_ArcWidth;
//     QColor m_OuterColor;
//     QString m_textSelector;
//     QString m_textDistance;
//     qreal full_distance;
// };

// class Indicators: public QObject
// {
//     Q_OBJECT
//     Q_PROPERTY(QVector<bool> indicator_str READ getIndicator_str WRITE setIndicator_str NOTIFY indicator_strChanged FINAL)
//     Q_PROPERTY(QVector<QString> indicator_path READ getIndicator_path WRITE setIndicator_path NOTIFY indicator_pathChanged FINAL)
//     Q_PROPERTY(QString speed_limiter READ getSpeed_limiter WRITE setSpeed_limiter NOTIFY speed_limiterChanged FINAL)

// public:
//     Indicators();
//     void update_dimensions();

//     void update_speed_limiter();

//     QVector<bool> getIndicator_str() const;
//     void setIndicator_str(const QVector<bool> &newIndicator_str);

//     QVector<QString> getIndicator_path() const;
//     void setIndicator_path(const QVector<QString> &newIndicator_path);

//     QString getSpeed_limiter() const;
//     void setSpeed_limiter(const QString &newSpeed_limiter);

// signals:


//     void indicator_strChanged();

//     void indicator_pathChanged();

//     void speed_limiterChanged();

// private:
//     QVector<bool> m_indicator_str;
//     QVector<QString> m_indicator_path;
//     QVector<QString> path_temp;
//     QString m_speed_limiter;
// };

// class setting_source:public  QObject
// {
//     Q_OBJECT
//     Q_PROPERTY(QVector<QString> name_optical_switch READ getName_optical_switch WRITE setName_optical_switch NOTIFY name_optical_switchChanged FINAL)
// public:
//     setting_source();
//     QVector<QString> getName_optical_switch() const;
//     void setName_optical_switch(const QVector<QString> &newName_optical_switch);
// signals:
//     void name_optical_switchChanged();
// private:
//     QVector<QString> m_name_optical_switch;
// };

// class Selector: public QObject
// {
//     Q_OBJECT
//     Q_PROPERTY(QVector<QString> path_selectorSource READ getPath_selectorSource WRITE setPath_selectorSource NOTIFY path_selectorSourceChanged FINAL)
//     Q_PROPERTY(QVector<bool> name_selectorSource READ getName_selectorSource WRITE setName_selectorSource NOTIFY name_selectorSourceChanged FINAL)
//     Q_PROPERTY(bool boolean_selectorSource READ getBoolean_selectorSource WRITE setBoolean_selectorSource NOTIFY boolean_selectorSourceChanged FINAL)

// public:
//     Selector();
//     QVector<bool> getName_selectorSource() const;
//     void setName_selectorSource(const QVector<bool> &newName_selectorSource);

//     QVector<QString> getPath_selectorSource() const;
//     void setPath_selectorSource(const QVector<QString> &newPath_selectorSource);

//     bool getBoolean_selectorSource() const;
//     void setBoolean_selectorSource(bool newBoolean_selectorSource);

// signals:
//     void name_selectorSourceChanged();

//     void path_selectorSourceChanged();

//     void boolean_selectorSourceChanged();

// private:
//     QVector<bool> m_name_selectorSource;
//     QVector<QString> m_path_selectorSource;
//     bool m_boolean_selectorSource;

// public slots:
//     void update_select(int i);
// };

// class CarDoor: public QObject
// {
//     Q_OBJECT
//     Q_PROPERTY(QVector<bool> name_carDoor READ getName_carDoor WRITE setName_carDoor NOTIFY name_carDoorChanged FINAL)
//     Q_PROPERTY(bool boolean_carDoor READ getBoolean_carDoor WRITE setBoolean_carDoor NOTIFY boolean_carDoorChanged FINAL)

// public:
//     CarDoor();
//     QVector<bool> getName_carDoor() const;
//     void setName_carDoor(const QVector<bool> &newName_carDoor);

//     bool getBoolean_carDoor() const;
//     void setBoolean_carDoor(bool newBoolean_carDoor);

// signals:
//     void name_carDoorChanged();

//     void boolean_carDoorChanged();

// private:
//     QVector<bool> m_name_carDoor;
//     bool m_boolean_carDoor;

// public slots:
//     void update_carDoor(int index);
// };


class LeftSourceFile : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool chargeStatus READ getChargeStatus WRITE setChargeStatus NOTIFY chargeStatusChanged FINAL)
    Q_PROPERTY(bool speedStatus READ getSpeedStatus WRITE setSpeedStatus NOTIFY speedStatusChanged FINAL)
    Q_PROPERTY(bool microStatus READ getMicroStatus WRITE setMicroStatus NOTIFY microStatusChanged FINAL)

    //Q_PROPERTY(setting_source* settingSource READ settingSource CONSTANT)
    //Q_PROPERTY(Selector* selectorSource READ selectorSource CONSTANT)
    Q_PROPERTY(Left_Charge_Widget* left_charge_object READ left_charge_object CONSTANT)
    Q_PROPERTY(Left_Speed_Widget* left_speed_object READ left_speed_object CONSTANT)

    Q_PROPERTY(QVector<QString> path_selectorSource READ getPath_selectorSource WRITE setPath_selectorSource NOTIFY path_selectorSourceChanged FINAL)
    Q_PROPERTY(QVector<bool> name_selectorSource READ getName_selectorSource WRITE setName_selectorSource NOTIFY name_selectorSourceChanged FINAL)
    Q_PROPERTY(bool boolean_selectorSource READ getBoolean_selectorSource WRITE setBoolean_selectorSource NOTIFY boolean_selectorSourceChanged FINAL)

    // Q_PROPERTY(QString battarySource READ getBattarySource WRITE setBattarySource NOTIFY battarySourceChanged FINAL)

public:
    explicit LeftSourceFile(QObject *parent = nullptr);

    //setting_source* settingSource() const;

    Left_Speed_Widget *left_speed_object() const;

    bool getChargeStatus() const;
    void setChargeStatus(bool newChargeStatus);

    bool getSpeedStatus() const;
    void setSpeedStatus(bool newSpeedStatus);

    bool getMicroStatus() const;
    void setMicroStatus(bool newMicroStatus);

    QVector<bool> getName_selectorSource() const;
    void setName_selectorSource(const QVector<bool> &newName_selectorSource);

    QVector<QString> getPath_selectorSource() const;
    void setPath_selectorSource(const QVector<QString> &newPath_selectorSource);

    bool getBoolean_selectorSource() const;
    void setBoolean_selectorSource(bool newBoolean_selectorSource);

    //Selector *selectorSource() const;

    Left_Charge_Widget *left_charge_object() const;

signals:
    void mainBarUpdated();
    void chargeStatusChanged();

    void speedStatusChanged();

    void microStatusChanged();

    void name_selectorSourceChanged();

    void path_selectorSourceChanged();

    void boolean_selectorSourceChanged();

private:
    //setting_source* m_settingSource;
    Left_Speed_Widget *m_left_speed_object = nullptr;
    bool m_chargeStatus;
    bool m_speedStatus;
    bool m_microStatus;

    QString m_battarySource;
    int battery_temp = 100;

    //Selector *m_selectorSource = nullptr;

    Left_Charge_Widget *m_left_charge_object = nullptr;

    QVector<bool> m_name_selectorSource;
    QVector<QString> m_path_selectorSource;
    bool m_boolean_selectorSource;

public slots:
    void update_mainBar(int num);
    void update_indicators();
    void update_selector(int index);
    void update_carDoor(int index);

public slots:
    void update_select(int i);
};

#endif // LEFTSOURCEFILE_H
