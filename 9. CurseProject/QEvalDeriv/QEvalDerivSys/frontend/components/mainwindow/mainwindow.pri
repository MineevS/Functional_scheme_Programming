# @file       mainwindow.h
# @date       09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
# @version    v1.0
# @author     Mineev S. A. [mineeff20@yandex.ru]
# @copyright  FreeSoft.
# @brief      Основное графическое окно программы.
# @details    Является вложением в AMainWindow.

# module:   mainwindow
# \brief    Описание зависимостей компонентов MainWindow.

SOURCES += $$PWD/mainwindow.cpp
HEADERS += $$PWD/mainwindow.h
FORMS   += $$PWD/mainwindow.ui

INCLUDEPATH += $$PWD

# Add in *.pro: include(mainwindow/mainwindow.pri)
