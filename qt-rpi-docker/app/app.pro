QT += widgets

CONFIG += c++17

TEMPLATE = app
TARGET = qt-rpi-app

SOURCES += \
    src/main.cpp \
    src/mainwindow.cpp

HEADERS += \
    src/mainwindow.h

FORMS += \
    forms/mainwindow.ui