# @file       settings.pri
# @date       09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
# @version    v1.0
# @author     Mineev S. A. [mineeff20@yandex.ru]
# @copyright  FreeSoft.
# @brief      Содержит модуль Settings.
# @details    Settings является неграфическим компонентом предназначенным для работы с настройками приложения.

# module: settings
#
SOURCES += $$PWD/settings.cpp
HEADERS += $$PWD/settings.h

INCLUDEPATH += $$PWD

# Add in *.pro: include(settings/settings.pri)
