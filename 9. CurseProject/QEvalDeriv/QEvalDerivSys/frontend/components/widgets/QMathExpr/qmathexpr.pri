# @file       qmathexpr.pri
# @date       09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
# @version    v1.0
# @author     Mineev S. A. [mineeff20@yandex.ru]
# @copyright  FreeSoft.
# @brief      Содержит модуль QMathExpr.
# @details    QMathExpr предназначен для отображения математических формул в формате подобному latex.

# module: QMathExpr
#
SOURCES += \
    $$PWD/src/src/abstract_big_parent_expression.cpp \
    $$PWD/src/src/abstract_expression.cpp \
    $$PWD/src/src/abstract_parent_expression.cpp \
    $$PWD/src/src/abstract_twin_parent_expression.cpp \
    $$PWD/src/src/argument_expression.cpp \
    $$PWD/src/src/asterix_expression.cpp \
    $$PWD/src/src/at_value_expression.cpp \
    $$PWD/src/src/base_expression.cpp \
    $$PWD/src/src/bracketed_expression.cpp \
    $$PWD/src/src/cap_expression.cpp \
    $$PWD/src/src/case_expression.cpp \
    $$PWD/src/src/chain_expression.cpp \
    $$PWD/src/src/character_expression.cpp \
    $$PWD/src/src/circulation_expression.cpp \
    $$PWD/src/src/comma_expression.cpp \
    $$PWD/src/src/common_function_expression.cpp \
    $$PWD/src/src/custom_text_expression.cpp \
    $$PWD/src/src/empty_expression.cpp \
    $$PWD/src/src/expression_builder.cpp \
    $$PWD/src/src/extended_number_expresssion.cpp \
    $$PWD/src/src/fraction_expression.cpp \
    $$PWD/src/src/frame_expression.cpp \
    $$PWD/src/src/function_expression.cpp \
    $$PWD/src/src/function_name_expression.cpp \
    $$PWD/src/src/group_expression.cpp \
    $$PWD/src/src/index_expression.cpp \
    $$PWD/src/src/integral_expression.cpp \
    $$PWD/src/src/lambda_expression.cpp \
    $$PWD/src/src/limit_expression.cpp \
    $$PWD/src/src/matrix_expression.cpp \
    $$PWD/src/src/nabla_expression.cpp \
    $$PWD/src/src/null_expression.cpp \
    $$PWD/src/src/number_expresssion.cpp \
    $$PWD/src/src/planck_expression.cpp \
    $$PWD/src/src/product_expression.cpp \
    $$PWD/src/src/root_expression.cpp \
    $$PWD/src/src/round_bracketed_expression.cpp \
    $$PWD/src/src/sign_expression.cpp \
    $$PWD/src/src/simple_expression.cpp \
    $$PWD/src/src/space_expression.cpp \
    $$PWD/src/src/stand_expression.cpp \
    $$PWD/src/src/strokes_expression.cpp \
    $$PWD/src/src/summa_expression.cpp \
    $$PWD/src/src/variable_expression.cpp

HEADERS += \
    $$PWD/src/inc/abstract_big_parent_expression.h  \
    $$PWD/src/inc/abstract_expression.h \
    $$PWD/src/inc/abstract_parent_expression.h \
    $$PWD/src/inc/abstract_twin_parent_expression.h \
    $$PWD/src/inc/argument_expression.h \
    $$PWD/src/inc/asterix_expression.h \
    $$PWD/src/inc/at_value_expression.h \
    $$PWD/src/inc/base_expression.h \
    $$PWD/src/inc/bracketed_expression.h \
    $$PWD/src/inc/cap_expression.h \
    $$PWD/src/inc/case_expression.h \
    $$PWD/src/inc/chain_expression.h \
    $$PWD/src/inc/character_expression.h \
    $$PWD/src/inc/circulation_expression.h \
    $$PWD/src/inc/comma_expression.h \
    $$PWD/src/inc/common_function_expression.h \
    $$PWD/src/inc/custom_text_expression.h \
    $$PWD/src/inc/empty_expression.h \
    $$PWD/src/inc/expression_builder.h \
    $$PWD/src/inc/extended_number_expresssion.h \
    $$PWD/src/inc/fraction_expression.h \
    $$PWD/src/inc/frame_expression.h \
    $$PWD/src/inc/function_expression.h \
    $$PWD/src/inc/function_name_expression.h \
    $$PWD/src/inc/global.h \
    $$PWD/src/inc/group_expression.h \
    $$PWD/src/inc/index_expression.h \
    $$PWD/src/inc/integral_expression.h \
    $$PWD/src/inc/lambda_expression.h \
    $$PWD/src/inc/limit_expression.h \
    $$PWD/src/inc/matrix_expression.h \
    $$PWD/src/inc/nabla_expression.h \
    $$PWD/src/inc/null_expression.h \
    $$PWD/src/inc/number_expresssion.h \
    $$PWD/src/inc/planck_expression.h \
    $$PWD/src/inc/product_expression.h \
    $$PWD/src/inc/root_expression.h \
    $$PWD/src/inc/round_bracketed_expression.h \
    $$PWD/src/inc/sign_expression.h \
    $$PWD/src/inc/simple_expression.h \
    $$PWD/src/inc/space_expression.h \
    $$PWD/src/inc/stand_expression.h \
    $$PWD/src/inc/strokes_expression.h \
    $$PWD/src/inc/summa_expression.h \
    $$PWD/src/inc/variable_expression.h

INCLUDEPATH += $$PWD $$PWD/src/inc

#message($$PWD)

# FORMS += widget.ui

# Add in base: include(qmathexpr.pri)
