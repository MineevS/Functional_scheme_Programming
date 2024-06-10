# @file       qpropertybrowser.pri
# @date       09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
# @version    v1.0
# @author     Mineev S. A. [mineeff20@yandex.ru]
# @copyright  FreeSoft (Qt Company Ltd: QPropertyBrowser).
# @brief      Содержит модуль QPropertyBrowser.
# @details    QPropertyBrowser является графическим компонентом предназначенным для группировки информации в виде иерархической структуры данных. Выпушен Copyright (C) 2016 The Qt Company Ltd. Источник: [http://www.wiki.crossplatform.ru/index.php/The_Property_Browser_Framework]

# module: QPropertyBrowser
#
SOURCES += \
    $$PWD/src/qtbuttonpropertybrowser.cpp \
    $$PWD/src/qteditorfactory.cpp \
    $$PWD/src/qtgroupboxpropertybrowser.cpp \
    $$PWD/src/qtpropertybrowser.cpp \
    $$PWD/src/qtpropertybrowserutils.cpp \
    $$PWD/src/qtpropertymanager.cpp \
    $$PWD/src/qttreepropertybrowser.cpp \
    $$PWD/src/qtvariantproperty.cpp

HEADERS += \
    $$PWD/inc/qtbuttonpropertybrowser.h \
    $$PWD/inc/qteditorfactory.h \
    $$PWD/inc/qtgroupboxpropertybrowser.h \
    $$PWD/inc/qtpropertybrowser.h \
    #$$PWD/inc/qtpropertybrowserutils.h \
    $$PWD/inc/qtpropertybrowserutils_p.h \
    $$PWD/inc/qtpropertymanager.h \
    $$PWD/inc/qttreepropertybrowser.h \
    $$PWD/inc/qtvariantproperty.h

INCLUDEPATH += $$PWD/inc/

#message($$PWD)

# FORMS += widget.ui

# Add in base: include(qpropertybrowser.pri)

# http://www.wiki.crossplatform.ru/index.php/The_Property_Browser_Framework
