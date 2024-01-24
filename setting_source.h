#ifndef SETTING_SOURCE_H
#define SETTING_SOURCE_H
#include <QObject>

class setting_source:public  QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector<QString> name_optical_switch READ getName_optical_switch WRITE setName_optical_switch NOTIFY name_optical_switchChanged FINAL)
public:
    setting_source();
    QVector<QString> getName_optical_switch() const;
    void setName_optical_switch(const QVector<QString> &newName_optical_switch);
signals:
    void name_optical_switchChanged();
private:
    QVector<QString> m_name_optical_switch;
};


#endif // SETTING_SOURCE_H
