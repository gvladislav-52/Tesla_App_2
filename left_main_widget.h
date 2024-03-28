#ifndef LEFT_MAIN_WIDGET_H
#define LEFT_MAIN_WIDGET_H

#include <QObject>
#include "left_charge_widget.h"
#include "left_speed_widget.h"

class Left_Main_Widget : public QObject
{
    Q_OBJECT

    //Управление виджетами левой стороны
    Q_PROPERTY(bool chargeStatus READ getChargeStatus WRITE setChargeStatus NOTIFY
                   chargeStatusChanged FINAL)
    Q_PROPERTY(
        bool speedStatus READ getSpeedStatus WRITE setSpeedStatus NOTIFY speedStatusChanged FINAL)
    Q_PROPERTY(
        bool microStatus READ getMicroStatus WRITE setMicroStatus NOTIFY microStatusChanged FINAL)
    Q_PROPERTY(bool autoresStatus READ getAutoresStatus WRITE setAutoresStatus NOTIFY
                   autoresStatusChanged FINAL)

    //Обьекты виджетов, для отображения
    Q_PROPERTY(Left_Charge_Widget *left_charge_object READ left_charge_object CONSTANT)
    Q_PROPERTY(Left_Speed_Widget *left_speed_object READ left_speed_object CONSTANT)

    //Работы селектора управлению авто, с правилом с участием двирей
    Q_PROPERTY(QVector<QString> path_selectorSource READ getPath_selectorSource WRITE
                   setPath_selectorSource NOTIFY path_selectorSourceChanged FINAL)
    Q_PROPERTY(QVector<bool> name_selectorSource READ getName_selectorSource WRITE
                   setName_selectorSource NOTIFY name_selectorSourceChanged FINAL)
    Q_PROPERTY(bool boolean_selectorSource READ getBoolean_selectorSource WRITE
                   setBoolean_selectorSource NOTIFY boolean_selectorSourceChanged FINAL)

public:
    explicit Left_Main_Widget(QObject *parent = nullptr);
    ~Left_Main_Widget();

    bool getChargeStatus() const;
    void setChargeStatus(bool newChargeStatus);
    bool getSpeedStatus() const;
    void setSpeedStatus(bool newSpeedStatus);
    bool getMicroStatus() const;
    void setMicroStatus(bool newMicroStatus);

    Left_Charge_Widget *left_charge_object() const;
    Left_Speed_Widget *left_speed_object() const;

    QVector<bool> getName_selectorSource() const;
    void setName_selectorSource(const QVector<bool> &newName_selectorSource);
    QVector<QString> getPath_selectorSource() const;
    void setPath_selectorSource(const QVector<QString> &newPath_selectorSource);
    bool getBoolean_selectorSource() const;
    void setBoolean_selectorSource(bool newBoolean_selectorSource);

    bool getAutoresStatus() const;
    void setAutoresStatus(bool newAutoresStatus);

signals:
    void mainBarUpdated(); //обновление левой стороны виджета, при нажатии на другой

    void chargeStatusChanged();
    void speedStatusChanged();
    void microStatusChanged();

    void name_selectorSourceChanged();
    void path_selectorSourceChanged();
    void boolean_selectorSourceChanged();

    void autoresStatusChanged();

private:
    bool m_chargeStatus;
    bool m_speedStatus;
    bool m_microStatus;

    Left_Speed_Widget *m_left_speed_object;
    Left_Charge_Widget *m_left_charge_object;

    QVector<bool> m_name_selectorSource;
    QVector<QString> m_path_selectorSource;
    bool m_boolean_selectorSource;

    bool m_autoresStatus;

public slots:
    void update_mainBar(int num);
    void update_indicators();
    void update_selector(int index);
    void update_carDoor(int index);

public slots:
    void update_select(int i);
};

#endif // LEFT_MAIN_WIDGET_H
