# @file       QEvalDeriv.pro
# @date       09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
# @version    v1.0
# @author     Mineev S. A. [mineeff20@yandex.ru]
# @copyright  FreeSoft (+ Qt Company Ltd: QPropertyBrowser).
# @brief      Основное графическое окно программы.
# @details    Является вложением в AMainWindow.

TEMPLATE = subdirs

SUBDIRS += \
    QEvalDerivSys \
    QEvalDerivTest

QEvalDerivTest.depends = QEvalDerivSys
