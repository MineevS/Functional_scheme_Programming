# @file       amainwindow.pri
# @date       09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
# @version    v1.0
# @author     Mineev S. A. [mineeff20@yandex.ru]
# @copyright  FreeSoft.
# @brief      Cодержит модуль AMainWindow.
# @details    Является основным обрамляющим окном,в которое вкладываются другие она типа QMainWindow.

SOURCES += $$PWD/amainwindow.cpp
HEADERS += $$PWD/amainwindow.h
FORMS   += $$PWD/amainwindow.ui

INCLUDEPATH += $$PWD

# Add in *.pro: include(amainwindow/amainwindow.pri)
