# @file       mainwindow.h
# @date       09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
# @version    v1.0
# @author     Mineev S. A. [mineeff20@yandex.ru]
# @copyright  FreeSoft.
# @brief      Основное графическое окно программы.
# @details    Является вложением в AMainWindow.

DEFINES += \
    ORGANIZATION_NAME=\\\"MIREA\\\" \
    ORGANIZATION_DOMAIN=\\\"mirea.ru\\\" \
    APPLICATION_NAME=\\\"QEvalDerivSys\\\" \
    APPLICATION_VERSION=\\\"0.1\\\" \
    THEME_FIRST_PATH=\\\"./qss/ThemeFirst.css\\\" \
    THEME_SECOND_PATH=\\\"./qss/ThemeSecond.css\\\" \ # Можно изменять расположение!
    INCLUDE_SETTINGS # Включить/Отключить для добавления/удаления функциональности изменения настроек; (Обязательно пересобрать проект!)

QT += core gui gui-private network sql # uitools #qcss
QT += testlib
# ? sudo apt-get -y install libxkbcommon-tools
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

win32 {
    QMAKE_CXXFLAGS += -Wa,-mbig-obj
}

#install a guile 3.0 and settings! (sudo apt install -y guile)
unix {
    CONFIG += link_pkgconfig
    PKGCONFIG += guile-3.0
}

############################################################

CONFIG += qt console warn_on depend_includepath testcase
CONFIG -= app_bundle

TEMPLATE = app

SOURCES +=  tst_qtester.cpp

STARTDIRAPP = $$PWD/../QEvalDerivSys

URL = $$STARTDIRAPP/frontend/components
    include($$URL/amainwindow/amainwindow.pri)
    include($$URL/mainwindow/mainwindow.pri)
    include($$URL/basewindow/basewindow.pri)
    include($$URL/wsettings/wsettings.pri)
URL = $$URL/widgets
    include($$URL/QSliderButton/qsliderbutton.pri)
    include($$URL/QStylizer/qstylizer.pri)
    include($$URL/QMathExpr/qmathexpr.pri)
    include($$URL/QExprWidget/qexprwidget.pri)
    include($$URL/QTelnet/qtelnet.pri)
    contains(DEFINES, INCLUDE_SETTINGS){
       message(include settings!)
       include($$URL/QPropertyBrowser/qpropertybrowser.pri)
    }
URL = $$STARTDIRAPP/frontend/design
    RC_ICONS = $$URL/icons/iconApp.ico
    RESOURCES += $$URL/qrecources_design.qrc # $$URL/resources.qrc \
URL = $$STARTDIRAPP/backend
    include($$URL/settings/settings.pri)
    include($$URL/CREATE_FILES/CREATE_FILES.pri)

