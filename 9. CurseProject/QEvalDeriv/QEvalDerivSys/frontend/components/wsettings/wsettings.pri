# @file       wsettings.pri
# @date       09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
# @version    v1.0
# @author     Mineev S. A. [mineeff20@yandex.ru]
# @copyright  FreeSoft.
# @brief      Содержит модуль WSettings.
# @details    WSettings является окном установки настройки оформления приложения.

# module: wsettings
#
SOURCES += \
        $$PWD/wsettings.cpp

HEADERS += \
        $$PWD/wsettings.h

FORMS += \
    $$PWD/wsettings.ui

INCLUDEPATH += $$PWD

# Add in *.pro: include(wsettings/wsettings.pri)
