/*!
 @file 		main.cpp
 @date 		09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
 @version   v1.0
 @author 	Mineev S. A. [mineeff20@yandex.ru]
 @copyright FreeSoft.
 @brief     Содержит точку входа в программу
 @details   Отсутсвуют
*/

#include "settings.h"
#include "mainwindow.h"

#include <QApplication>

#if QT_VERSION <= 0x051500
    #include <QDesktopWidget>
    #include <QRect>
#endif

#include <QScreen>

/*!
 @brief		Точка входа в программу.

 @param[in] argv @brief Кл.во принимаемых параметров из командной строки.
 @param[in] argc @brief Массив принимаемых параметров из командной строки.

 @return {@brief Ничего не возвращает}
*/
/// @snippet this main
//! [main]
int main(int argc, char *argv[]){
    QCoreApplication::setOrganizationName(ORGANIZATION_NAME);
    QCoreApplication::setOrganizationDomain(ORGANIZATION_DOMAIN);
    QCoreApplication::setApplicationName(APPLICATION_NAME);

    QApplication a(argc, argv);

    qApp->setProperty("settingsApp", QVariant::fromValue(new Settings()));
    
    MainWindow mw;

#if QT_VERSION <= 0x051500
    QRect rect = QApplication::primaryScreen()->availableGeometry();
    mw.setGeometry(0, 0, rect.width(), rect.height());
#endif

    mw.show();

    return a.exec();
}
//! [main]
//!
