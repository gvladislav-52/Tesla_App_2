QT       += core gui quickwidgets location network positioning qml quick xml sql

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    additional_window.cpp \
    left_charge_widget.cpp \
    left_main_widget.cpp \
    left_speed_widget.cpp \
    main.cpp \
    right_footer_widget.cpp \
    right_header_widget.cpp \
    right_main_widget.cpp \
    right_map_widget.cpp \
    sql_file.cpp

HEADERS += \
    additional_window.h \
    left_charge_widget.h \
    left_main_widget.h \
    left_speed_widget.h \
    right_footer_widget.h \
    right_header_widget.h \
    right_main_widget.h \
    right_map_widget.h \
    sql_file.h

FORMS +=

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    resource.qrc
