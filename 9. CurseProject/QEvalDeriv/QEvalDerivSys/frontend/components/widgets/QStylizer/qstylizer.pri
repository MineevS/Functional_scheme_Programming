# @file       qstylizer.pri
# @date       09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
# @version    v1.0
# @author     Mineev S. A. [mineeff20@yandex.ru]
# @copyright  FreeSoft.
# @brief      Содержит модуль QStylize.
# @details    QStylize предназначен для парсинга настроек, перевода их в вид, пригодного для изменения и сборки их обратно в формат строкового типа.

# module: QStylizer
#
SOURCES += $$PWD/qstylizer.cpp
HEADERS += $$PWD/qstylizer.h

INCLUDEPATH += $$PWD

# Add in *.pro: include(qstylizer.pri)
