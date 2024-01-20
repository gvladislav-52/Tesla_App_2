#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "footer.h"
#include "headermap.h"
#include "rightsourcefile.h"

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
#if QT_CONFIG(ssl)
    engine.rootContext()->setContextProperty("supportsSsl", QSslSocket::supportsSsl());
#else
    engine.rootContext()->setContextProperty("supportsSsl", false);
#endif
    QMetaObject::invokeMethod(engine.rootObjects().value(0), "initializeProviders");
    return app.exec();
}
