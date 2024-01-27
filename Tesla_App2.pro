QT       += core gui quickwidgets location network positioning qml quick xml

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    additional_window.cpp \
    footer.cpp \
    headermap.cpp \
    left_charge_widget.cpp \
    left_main_widget.cpp \
    left_speed_widget.cpp \
    main.cpp \
    rightsourcefile.cpp

HEADERS += \
    additional_window.h \
    footer.h \
    headermap.h \
    left_charge_widget.h \
    left_main_widget.h \
    left_speed_widget.h \
    rightsourcefile.h

FORMS +=

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    resource.qrc
