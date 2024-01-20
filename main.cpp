#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "footer.h"
#include "headermap.h"
#include "rightsourcefile.h"
#include "leftsourcefile.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 6, 1)
    QCoreApplication::setAttribure(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    //LeftSourceFile leftSource;
    headerMap header_temp;
    footer footer_temp;
    RightSourceFile right_temp;
    QQmlApplicationEngine engine;
    qmlRegisterType<leftsourcefile>("com.ulasdikme.speedometer",1,0,"Speedometer");
    const QUrl url(QStringLiteral("qrc:/MainQML.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.load(url);
    QQmlContext *rootContext = engine.rootContext();
    //rootContext->setContextProperty("leftClass",&leftSource);
    rootContext->setContextProperty("header_temp_qml", &header_temp);
    rootContext->setContextProperty("footer_temp_qml", &footer_temp);
    rootContext->setContextProperty("right_temp_qml", &right_temp);

    QObject *object = engine.rootObjects()[0];
    QObject *speedometer = object->findChild<QObject*>("speedoMeter");

    leftsourcefile * ptrSpeedometr = qobject_cast<leftsourcefile*>(speedometer);
    qreal val = 0;
    ptrSpeedometr->setSpeed(val);

    QTimer timer1;
    bool direction;
    QObject::connect(&timer1, &QTimer::timeout, [&]()
                     {
                         qDebug() << val;
                         if (val < 1500)
                             ptrSpeedometr->setOuterColor(QColor(128,255,0));
                         else if (val > 1500 && val < 3000)
                             ptrSpeedometr->setOuterColor(QColor(255,255,0));
                         else if (val > 3000 && val < 4000)
                             ptrSpeedometr->setOuterColor(QColor(255,0,0));
                         if(val >= 4450)
                             direction = false;
                         else if (val <= 0.1)
                             direction = true;

                         if(direction)
                             val = val+ 10;
                         else
                             val = val - 10;
                         ptrSpeedometr->setSpeed(val);
                     });

    timer1.start(10);

#if QT_CONFIG(ssl)
    engine.rootContext()->setContextProperty("supportsSsl", QSslSocket::supportsSsl());
#else
    engine.rootContext()->setContextProperty("supportsSsl", false);
#endif
    QMetaObject::invokeMethod(engine.rootObjects().value(0), "initializeProviders");
    return app.exec();
}
