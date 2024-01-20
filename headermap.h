#ifndef HEADERMAP_H
#define HEADERMAP_H

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

class headerMap : public QObject
{
    Q_OBJECT
    Q_PROPERTY(
        QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged FINAL)
    Q_PROPERTY(
        QString temperature READ temperature WRITE settemperature NOTIFY temperatureChanged FINAL)
public:
    headerMap(QObject *parent = nullptr);
    QString currentTime() const;
    void setCurrentTime(const QString &newCurrentTime);

    QString temperature() const;
    void settemperature(const QString &newTemperature);

signals:
    void currentTimeChanged();

    void temperatureChanged();

private:
    QString m_currentTime;
    QTimer *m_currentTimeTimer;
    QString temparature;

    QString m_temperature;

public slots:
    void currentTimeTimerTimeout();
    void temperatureSlot();
};

#endif // HEADERMAP_H
