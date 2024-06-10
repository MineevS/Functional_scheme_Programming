/*!
 @file 		qstylizer.cpp
 @date 		09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
 @version   v1.0
 @author 	Mineev S. A. [mineeff20@yandex.ru]
 @copyright FreeSoft.
 @brief     Содержит реализацию неграфического компонента QSylizer.
 @details   QStylize предназначен для парсинга настроек, перевода их в вид, пригодного для изменения и сборки их обратно в формат строкового типа.
*/

#include "qstylizer.h"

QStylizer::QStylizer() {

}

QStylizer::QStylizer(const QString& style) {
    _style = style; // ! copy Data;

    convertStyleSheetQStringToQMapRef();
}

