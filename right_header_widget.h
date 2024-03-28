#ifndef RIGHT_HEADER_WIDGET_H
#define RIGHT_HEADER_WIDGET_H

#include <QLabel>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QObject>
#include <QQuickWidget>
#include <QVBoxLayout>
#include <QtQuick>
#include <QtWidgets>
#include <QtXml>

#include "sql_file.h"
class Right_Header_Widget : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString string_currentTime READ getString_currentTime WRITE setString_currentTime
                   NOTIFY string_currentTimeChanged FINAL)
    Q_PROPERTY(QString string_temperature READ getString_temperature WRITE setString_temperature
                   NOTIFY string_temperatureChanged FINAL)
    Q_PROPERTY(sql_file *name_data READ name_data CONSTANT)
public:
    Right_Header_Widget(QObject *parent = nullptr);

    QString getString_currentTime() const;
    void setString_currentTime(const QString &newCurrentTime);

    QString getString_temperature() const;
    void setString_temperature(const QString &newTemperature);

    sql_file *name_data() const;

signals:
    void string_currentTimeChanged();

    void string_temperatureChanged();

private:
    QString m_string_currentTime;
    QString temparature;

    QString m_string_temperature;

    sql_file *m_name_data = nullptr;

public slots:
    void currentTimeTimerTimeout();
    void temperatureSlot();
    void autoresetion(QString login, QString password);
    void regestration(QString name, QString login, QString password);
};

#endif // RIGHT_HEADER_WIDGET_H
