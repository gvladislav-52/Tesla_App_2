#include "right_header_widget.h"

#include <QDateTime>
#include <QDebug>
#include <QRandomGenerator>
#include <QString>

Right_Header_Widget::Right_Header_Widget(QObject *parent)
    : QObject(parent)
    , m_string_currentTime("00:00am")
{
    currentTimeTimerTimeout();
    temperatureSlot();
    //sql_object.search();
    m_name_data = new sql_file();
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

void Right_Header_Widget::autoresetion(QString login, QString password)
{
    if (login.isEmpty() || password.isEmpty())
        qDebug() << "Поля пустые";
    else
        m_name_data->search(login, password);
}

void Right_Header_Widget::regestration(QString name, QString login, QString password)
{
    if (name.isEmpty() || login.isEmpty() || password.isEmpty())
        qDebug() << "Поля пустые";
    else
        m_name_data->add_query_function(name, login, password);
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

sql_file *Right_Header_Widget::name_data() const
{
    return m_name_data;
}
