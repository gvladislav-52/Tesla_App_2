#ifndef RIGHT_MAP_WIDGET_H
#define RIGHT_MAP_WIDGET_H

#include <QObject>
#include <QVariantMap>

class Right_Map_Widget : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantMap to_coordinate_temp READ getTo_coordinate_temp NOTIFY
                   to_coordinate_tempChanged FINAL)
    Q_PROPERTY(QVariantMap from_coordinate_temp READ getFrom_coordinate_temp NOTIFY
                   from_coordinate_tempChanged FINAL)
public:
    Right_Map_Widget();

    QVariantMap getTo_coordinate_temp() const;
    void setTo_coordinate_temp(double, double);

    QVariantMap getFrom_coordinate_temp() const;
    void setFrom_coordinate_temp(double, double);

signals:
    void to_coordinate_tempChanged();

    void from_coordinate_tempChanged();

private:
    QVariantMap m_to_coordinate_temp;
    QVariantMap m_from_coordinate_temp;
public slots:
    void update_map_to_coordinate(double latitude, double longitude);
};

#endif // RIGHT_MAP_WIDGET_H
