#ifndef RIGHT_MAIN_WIDGET_H
#define RIGHT_MAIN_WIDGET_H

#include "right_header_widget.h"
#include "right_footer_widget.h"
#include "right_map_widget.h"
#include <QObject>

class Right_Main_Widget: public QObject
{
    Q_OBJECT
    Q_PROPERTY(Right_Header_Widget* right_header_object READ right_header_object CONSTANT)
    Q_PROPERTY(Right_Footer_Widget* right_footer_object READ right_footer_object CONSTANT)
    Q_PROPERTY(Right_Map_Widget* right_map_object READ right_map_object CONSTANT)

    Q_PROPERTY(bool temp_DayNightMap READ getTemp_DayNightMap WRITE setTemp_DayNightMap NOTIFY temp_DayNightMapChanged FINAL)
public:
    explicit Right_Main_Widget(QObject *parent = nullptr);
    ~Right_Main_Widget();
    Right_Header_Widget *right_header_object() const;
    Right_Footer_Widget *right_footer_object() const;

    bool getTemp_DayNightMap() const;
    void setTemp_DayNightMap(bool newCarLocked);

    Right_Map_Widget *right_map_object() const;

signals:
    void temp_DayNightMapChanged();

private:
    Right_Header_Widget *m_right_header_object = nullptr;
    Right_Footer_Widget *m_right_footer_object = nullptr;
    bool m_temp_DayNightMap;
    Right_Map_Widget *m_right_map_object = nullptr;
};

#endif // RIGHT_MAIN_WIDGET_H
