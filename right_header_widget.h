#ifndef RIGHT_HEADER_WIDGET_H
#define RIGHT_HEADER_WIDGET_H

#include <QLabel>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QObject>
#include <QQuickWidget>
#include <QTimer>
#include <QVBoxLayout>
#include <QtQuick>
#include <QtWidgets>
#include <QtXml>

class Right_Header_Widget : public QObject
{
    Q_OBJECT
    Q_PROPERTY(
        QString string_currentTime READ getString_currentTime WRITE setString_currentTime NOTIFY string_currentTimeChanged FINAL)
    Q_PROPERTY(
        QString string_temperature READ getString_temperature WRITE setString_temperature NOTIFY string_temperatureChanged FINAL)
public:
    Right_Header_Widget(QObject *parent = nullptr);

    QString getString_currentTime() const;
    void setString_currentTime(const QString &newCurrentTime);

    QString getString_temperature() const;
    void setString_temperature(const QString &newTemperature);

signals:
    void string_currentTimeChanged();

    void string_temperatureChanged();

private:
    QString m_string_currentTime;
    QTimer *m_currentTimeTimer;
    QString temparature;

    QString m_string_temperature;

public slots:
    void currentTimeTimerTimeout();
    void temperatureSlot();
};

#endif // RIGHT_HEADER_WIDGET_H
