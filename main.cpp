#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "footer.h"
#include "headermap.h"
#include "rightsourcefile.h"
#include "additional_window.h"
#include "left_speed_widget.h"
#include "left_main_widget.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 6, 1)
    QCoreApplication::setAttribure(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);                                            //Создание обьекта приложения Qt для графического интерфейса пользователя
    headerMap header_temp;
    footer footer_temp;
    RightSourceFile right_temp;
    Left_Main_Widget left_main_temp;
    additional_window add_temp;

    QQmlApplicationEngine engine;                                               //Создание обьекта для загрузки и выполнения QML-code
    qmlRegisterType<Speedometer>("my_type_speedometer",1,0,"Speedometer");   //Регистрация типа leftsourcefile в QML под именем Speedometer
    const QUrl url(QStringLiteral("qrc:/MainQML.qml"));                         //Загрузка основной QML-страницы
    QObject::connect(&engine,&QQmlApplicationEngine::objectCreated,&app,[url](QObject *obj, const QUrl &objUrl)
        {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);                                               //Установка соединения, которое будет вызвано при создании объектов Qt Quick из QML.
                                                                                //Если объект не создан и URL совпадает, вызывается QCoreApplication::exit().

    engine.load(url);                                                           //3агрузка QML-файла по указанному URL
    QQmlContext *rootContext = engine.rootContext();                            //Получения корневого контекста QML-движка (загрузки и выполнения кода)
    rootContext->setContextProperty("header_temp_qml", &header_temp);           //Установка свойства контекста QML для объектов
    rootContext->setContextProperty("footer_temp_qml", &footer_temp);
    rootContext->setContextProperty("right_temp_qml", &right_temp);
    rootContext->setContextProperty("add_temp_qml",&add_temp);
    rootContext->setContextProperty("left_main_source",&left_main_temp);
    //[Speedometr]
    QObject *object = engine.rootObjects()[0];                                  //Получение корневого объекта QML
    QObject *speedometer = object->findChild<QObject *>("speedometer_object_qml");         //Поиск дочернего объекта с именем "speedometer_object_qml"  в файле QML, для дальнейшей работы с ним
    Speedometer *ptrSpeedometer = qobject_cast<Speedometer*>(object->findChild<QObject *>("speedometer_object_qml"));    //Приведение при помощи qobject_cast к типу leftsourcefile
    qreal value = 0;
    ptrSpeedometer->setSpeed(value);                                                //устанавливаем скорость спидометра, которая зависит на данный момент от времени
    QTimer timer;                                                                   //устанавливаем таймер
    bool direction = true;                                                          //переменная отвечающая за направление
    QObject::connect(&timer, &QTimer::timeout, [&]() {
        static int count = 0;
        if (count % 200 == 0) {
            left_main_temp.left_speed_object()->update_speed_limiter();
            left_main_temp.left_charge_object()->update_battery();
        }
        ptrSpeedometer->updateTahometer(value);
        ptrSpeedometer->updateSpeedometer(value, direction);
        ptrSpeedometer->updateDistance(value);
        count++;
    });
    timer.start(10);                                                                //запуск таймера с шагом на 10

#if QT_CONFIG(ssl)
    engine.rootContext()->setContextProperty("supportsSsl", QSslSocket::supportsSsl()); //Устанавливаем свойства контекста QML поддержки SSL, для Map
#else
    engine.rootContext()->setContextProperty("supportsSsl", false);
#endif
    QMetaObject::invokeMethod(engine.rootObjects().value(0), "initializeProviders");    //Вызов метода initializeProviders у корневого объекта QML для Map
    return app.exec();
}
