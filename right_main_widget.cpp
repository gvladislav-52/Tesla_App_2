#include "right_main_widget.h"

Right_Main_Widget::Right_Main_Widget(QObject *parent) : QObject(parent)
{
    m_right_footer_object = new Right_Footer_Widget();
    m_right_header_object = new Right_Header_Widget();
    m_right_map_object = new Right_Map_Widget();
    //m_right_map_object->setTo_coordinate_temp(-0, -0);
    m_right_map_object->setFrom_coordinate_temp(56.307706, 43.984085);
    m_temp_DayNightMap = true;
    m_temp_ErrorPopup.append("Enter a different address");
    m_temp_ErrorPopup.append("Please enter a valid address");
    m_temp_ErrorPopup.append("Error! Switch the selector to the PARKING gear to open the doors");
    m_temp_ErrorPopup.append("Error! Close all doors before continuing to move");
    m_right_footer_object->setMuted_music(false);
    m_name_music = "none";
    m_name_artist = "none";

    QDir directory("C:\\Users\\gvlad\\Desktop\\exepsion\\QT Studia\\Tesla_App2\\ui\\music"); // Укажите полный путь к папке
    directory_path = directory;
    fileNames = directory.entryList(QDir::Files | QDir::NoDotAndDotDot);
    m_music_path.append(directory_path.filePath(fileNames.at(current_temp)));
}

void Right_Main_Widget::left_update_music()
{
    if(current_temp > 0)
    {
    current_temp--;
    prev_temp = --current_temp;
    next_temp = ++current_temp;
    m_music_path[0] = directory_path.filePath(fileNames.at(current_temp));
    emit music_pathChanged();
    }
}

void Right_Main_Widget::right_update_music()
{
    if(current_temp < (fileNames.size()-1))
    {
    current_temp++;
    prev_temp = --current_temp;
    next_temp = ++current_temp;
    m_music_path[0] = directory_path.filePath(fileNames.at(current_temp));
    emit music_pathChanged();
    }
}

Right_Main_Widget::~Right_Main_Widget()
{
    delete m_right_map_object;
    delete m_right_header_object;
    delete m_right_footer_object;
}

Right_Header_Widget *Right_Main_Widget::right_header_object() const
{
    return m_right_header_object;
}

Right_Footer_Widget *Right_Main_Widget::right_footer_object() const
{
    return m_right_footer_object;
}

bool Right_Main_Widget::getTemp_DayNightMap() const
{
    return m_temp_DayNightMap;
}

void Right_Main_Widget::setTemp_DayNightMap(bool newCarLocked)
{
    if (m_temp_DayNightMap == newCarLocked)
        return;
    m_temp_DayNightMap = newCarLocked;
    emit temp_DayNightMapChanged();
}

Right_Map_Widget *Right_Main_Widget::right_map_object() const
{
    return m_right_map_object;
}

QVector<QString> Right_Main_Widget::getTemp_ErrorPopup() const
{
    return m_temp_ErrorPopup;
}

void Right_Main_Widget::setTemp_ErrorPopup(const QVector<QString> &newTemp_ErrorPopup)
{
    if (m_temp_ErrorPopup == newTemp_ErrorPopup)
        return;
    m_temp_ErrorPopup = newTemp_ErrorPopup;
    emit temp_ErrorPopupChanged();
}

QString Right_Main_Widget::getName_music() const
{
    return m_name_music;
}

void Right_Main_Widget::setName_music(const QString &newName_music)
{
    if (m_name_music == newName_music)
        return;
    m_name_music = newName_music;
    emit name_musicChanged();
}

QString Right_Main_Widget::getName_artist() const
{
    return m_name_artist;
}

void Right_Main_Widget::setName_artist(const QString &newName_artist)
{
    if (m_name_artist == newName_artist)
        return;
    m_name_artist = newName_artist;
    emit name_artistChanged();
}

QVector<QString> Right_Main_Widget::getMusic_path() const
{
    return m_music_path;
}

void Right_Main_Widget::setMusic_path(const QVector<QString> &newMusic_path)
{
    if (m_music_path == newMusic_path)
        return;
    m_music_path = newMusic_path;
    emit music_pathChanged();
}
