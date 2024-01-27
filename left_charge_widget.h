#ifndef LEFT_CHARGE_WIDGET_H
#define LEFT_CHARGE_WIDGET_H

#include <QObject>
class Left_Charge_Widget: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<bool> vector_carDoor READ getVector_carDoor WRITE setVector_carDoor NOTIFY vector_carDoorChanged FINAL)
    Q_PROPERTY(bool boolean_carDoor READ getBoolean_carDoor WRITE setBoolean_carDoor NOTIFY boolean_carDoorChanged FINAL)
    Q_PROPERTY(QString battarySource READ getBattarySource WRITE setBattarySource NOTIFY battarySourceChanged FINAL)
    Q_PROPERTY(QString battary_path READ getBattary_path WRITE setBattary_path NOTIFY battary_pathChanged FINAL)

public:
    Left_Charge_Widget();
    void update_battery();
    QVector<bool> getVector_carDoor() const;
    void setVector_carDoor(const QVector<bool> &newVector_carDoor);
    bool getBoolean_carDoor() const;
    void setBoolean_carDoor(bool newBoolean_carDoor);

    QString getBattarySource() const;
    void setBattarySource(const QString &newBattarySource);

    QString getBattary_path() const;
    void setBattary_path(const QString &newBattary_path);

signals:
    void vector_carDoorChanged();
    void boolean_carDoorChanged();

    void battarySourceChanged();

    void battary_pathChanged();

private:
    QVector<bool> m_vector_carDoor;
    bool m_boolean_carDoor;

    QString m_battarySource;
    int battery_temp = 100;

    QString m_battary_path;

public slots:
    void update_carDoor(int index);
};

#endif // LEFT_CHARGE_WIDGET_H
