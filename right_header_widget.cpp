#include "right_header_widget.h"

#include <QDateTime>
#include <QDebug>
#include <QRandomGenerator>
#include <QString>

Right_Header_Widget::Right_Header_Widget(QObject *parent)
    : QObject(parent)
    , m_string_currentTime("00:00am")
{
    m_currentTimeTimer = new QTimer(this);
    m_currentTimeTimer->setInterval(1000);
    m_currentTimeTimer->setSingleShot(true);
    connect(m_currentTimeTimer, &QTimer::timeout, this, &Right_Header_Widget::currentTimeTimerTimeout);
    //connect(m_currentTimeTimer,&QTimer::timeout, this, &headerMap::temperatureSlot);
    currentTimeTimerTimeout();
    temperatureSlot();
}

QString Right_Header_Widget::getString_currentTime() const
{
    return m_string_currentTime;
}

void Right_Header_Widget::setString_currentTime(const QString &newCurrentTime)
{
    if (m_string_currentTime == newCurrentTime)
        return;
    m_string_currentTime = newCurrentTime;
    emit string_currentTimeChanged();
}

void Right_Header_Widget::currentTimeTimerTimeout()
{
    QDateTime dateTime;
    QString currentTime = dateTime.currentDateTime().toString("hh:mm AP");
    //qDebug() << currentTime;
    setString_currentTime(currentTime);

    m_currentTimeTimer->start();
}

void Right_Header_Widget::temperatureSlot()
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
    setString_temperature(temp);
}

QString Right_Header_Widget::getString_temperature() const
{
    if (m_string_temperature == "-0")
        return "0";
    else
        return m_string_temperature;
}

void Right_Header_Widget::setString_temperature(const QString &newTemperature)
{
    if (m_string_temperature == newTemperature)
        return;
    m_string_temperature = newTemperature;
    emit string_temperatureChanged();
}
