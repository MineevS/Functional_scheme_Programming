# @file       qtelnet.pri
# @date       09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
# @version    v1.0
# @author     Mineev S. A. [mineeff20@yandex.ru]
# @copyright  FreeSoft.
# @brief      Содержит неграфический компонент QTelnet.
# @details    QTelnet является неграфическим компонентом, предназначенным для обеспечения соединения с утилитой Guile.

# module: QTelnet
#
SOURCES += $$PWD/QTelnet.cpp
HEADERS += $$PWD/QTelnet.h

INCLUDEPATH += $$PWD 

# Add in *.pro: include(qtelnet.pri)
