# @file       mainwindow.h
# @date       09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
# @version    v1.0
# @author     Mineev S. A. [mineeff20@yandex.ru]
# @copyright  FreeSoft.
# @brief      Основное графическое окно программы.
# @details    Является вложением в AMainWindow.

# module: basewindow
#
SOURCES += $$PWD/basewindow.cpp
HEADERS += $$PWD/basewindow.h
FORMS += $$PWD/basewindow.ui

INCLUDEPATH += $$PWD

# Add in *.pro: include(basewindow/basewindow.pri)
