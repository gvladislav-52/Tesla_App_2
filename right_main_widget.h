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
    Q_PROPERTY(QVector<QString> temp_ErrorPopup READ getTemp_ErrorPopup WRITE setTemp_ErrorPopup NOTIFY temp_ErrorPopupChanged FINAL)

    Q_PROPERTY(QString name_music READ getName_music WRITE setName_music NOTIFY name_musicChanged FINAL)
    Q_PROPERTY(QString name_artist READ getName_artist WRITE setName_artist NOTIFY name_artistChanged FINAL)
    Q_PROPERTY(QVector<QString> music_path READ getMusic_path WRITE setMusic_path NOTIFY music_pathChanged FINAL)


public:
    explicit Right_Main_Widget(QObject *parent = nullptr);
    ~Right_Main_Widget();
    Right_Header_Widget *right_header_object() const;
    Right_Footer_Widget *right_footer_object() const;

    bool getTemp_DayNightMap() const;
    void setTemp_DayNightMap(bool newCarLocked);

    Right_Map_Widget *right_map_object() const;

    QVector<QString> getTemp_ErrorPopup() const;
    void setTemp_ErrorPopup(const QVector<QString> &newTemp_ErrorPopup);

    QString getName_music() const;
    void setName_music(const QString &newName_music);

    QString getName_artist() const;
    void setName_artist(const QString &newName_artist);

    QVector<QString> getMusic_path() const;
    void setMusic_path(const QVector<QString> &newMusic_path);

    //void right_update_music();

signals:
    void temp_DayNightMapChanged();

    void temp_ErrorPopupChanged();

    void name_musicChanged();

    void name_artistChanged();

    void music_pathChanged();

private:
    Right_Header_Widget *m_right_header_object = nullptr;
    Right_Footer_Widget *m_right_footer_object = nullptr;
    bool m_temp_DayNightMap;
    Right_Map_Widget *m_right_map_object = nullptr;
    QVector<QString> m_temp_ErrorPopup;
    QString m_name_music;
    QString m_name_artist;
    QVector<QString> m_music_path;
    QDir directory_path;
    QStringList fileNames;
    int prev_temp;
    int current_temp = 0;
    int next_temp;
    QString dir_path_string;

public slots:
    void right_update_music();
    void left_update_music();
};

#endif // RIGHT_MAIN_WIDGET_H
