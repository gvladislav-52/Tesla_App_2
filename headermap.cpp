#include "headermap.h"
#include <QDateTime>
#include <QDebug>
#include <QRandomGenerator>
#include <QString>

headerMap::headerMap(QObject *parent)
    : QObject(parent)
    , m_currentTime("12:34am")
{
    m_currentTimeTimer = new QTimer(this);
    m_currentTimeTimer->setInterval(1000);
    m_currentTimeTimer->setSingleShot(true);
    connect(m_currentTimeTimer, &QTimer::timeout, this, &headerMap::currentTimeTimerTimeout);
    //connect(m_currentTimeTimer,&QTimer::timeout, this, &headerMap::temperatureSlot);
    currentTimeTimerTimeout();
    temperatureSlot();
}

QString headerMap::currentTime() const
{
    return m_currentTime;
}

void headerMap::setCurrentTime(const QString &newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;
    emit currentTimeChanged();
}

void headerMap::currentTimeTimerTimeout()
{
    QDateTime dateTime;
    QString currentTime = dateTime.currentDateTime().toString("hh:mm AP");
    //qDebug() << currentTime;
    setCurrentTime(currentTime);

    m_currentTimeTimer->start();
}

void headerMap::temperatureSlot()
{
    QNetworkAccessManager *manager = new QNetworkAccessManager();
    QNetworkReply *reply = manager->get(QNetworkRequest(QUrl(
        "https://api.openweathermap.org/data/2.5/"
        "weather?id=520555&units=metric&lang=ru&mode=xml&appid=6fb550ae11156e5729fa09c190689581")));

    QEventLoop loop;
    connect(reply, &QNetworkReply::finished, &loop, &QEventLoop::quit);
    loop.exec();

    QByteArray data = reply->readAll();
    QString str = QString::fromUtf8(data);

    reply->deleteLater();
    manager->deleteLater();

    //Разбираем полученные (XML) данные
    QXmlStreamReader reader(str); //класс для разбора XML
    QString temp;
    while (!reader.atEnd()) {
        if (reader.isStartElement()) {
            QString name = reader.name().toString();

            // ТЕМПЕРАТУРА ВОЗДУХА
            if (name == "temperature") {
                QXmlStreamAttributes attributes = reader.attributes();
                if (attributes.hasAttribute("min")) {
                    QString tempWithDot = attributes.value("min").toString();
                    int dotIndex = tempWithDot.indexOf('.');
                    temp = tempWithDot.left(dotIndex);
                    //qDebug() << temp;
                }
            }
        }
        reader.readNext();
    }
    settemperature(temp);
}

QString headerMap::temperature() const
{
    if (m_temperature == "-0")
        return "0";
    else
        return m_temperature;
}

void headerMap::settemperature(const QString &newTemperature)
{
    if (m_temperature == newTemperature)
        return;
    m_temperature = newTemperature;
    emit temperatureChanged();
}
