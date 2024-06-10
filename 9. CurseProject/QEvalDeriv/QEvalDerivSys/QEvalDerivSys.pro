# @file       QEvalDerivSys.pro
# @date       09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
# @version    v1.0
# @author     Mineev S. A. [mineeff20@yandex.ru]
# @copyright  FreeSoft.
# @brief      Основное графическое окно программы.
# @details    Является вложением в AMainWindow.

TEMPLATE = app #subdirs

# При изменении данного файла обязательно явно пересобирать проект!

DEFINES += \
    ORGANIZATION_NAME=\\\"MIREA\\\" \
    ORGANIZATION_DOMAIN=\\\"mirea.ru\\\" \
    APPLICATION_NAME=\\\"QEvalDerivSys\\\" \
    APPLICATION_VERSION=\\\"0.1\\\" \
    THEME_FIRST_PATH=\\\"./qss/ThemeFirst.css\\\" \
    THEME_SECOND_PATH=\\\"./qss/ThemeSecond.css\\\" \ # Можно изменять расположение!
    INCLUDE_SETTINGS # Включить/Отключить для добавления/удаления функциональности изменения настроек; (Обязательно пересобрать проект!)

# ! sudo apt-get install libxkbcommon-dev
# ? sudo apt-get -y install libxkbcommon-tools

QT += core gui gui-private network # sql uitools #qcss
QT += testlib

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

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += main.cpp

#modules:
#frontend-components:

STARTDIRAPP = $$PWD

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

#######################################################

# Default rules for deployment.
#qnx: target.path = /tmp/$${TARGET}/bin
#else: unix:!android: target.path = /opt/$${TARGET}/bin
#!isEmpty(target.path): INSTALLS += target

#SUBDIRS += tests/QEvalDerivTest

