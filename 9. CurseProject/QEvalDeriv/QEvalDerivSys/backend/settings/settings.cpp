/*!
 @file 		settings.cpp
 @date 		09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
 @version   v1.0
 @author 	Mineev S. A. [mineeff20@yandex.ru]
 @copyright FreeSoft.
 @brief     Содержит реализацию неграфического компонента Settings.
 @details   Settings является неграфическим компонентом предназначенным для работы с настройками приложения.
*/

#include "settings.h"

Settings::Settings() {
    settingsApp = new QSettings(ORGANIZATION_NAME, APPLICATION_NAME);

    if(loadSettingsApp()){
        loadThemeCurrentApp();
        loadStyleCurrentApp();

        qApp->setStyleSheet(currentStyleApp);
    }
}

Settings::Settings(QApplication *app)
{
    settingsApp = new QSettings(ORGANIZATION_NAME, APPLICATION_NAME);

    if(loadSettingsApp()){
        loadThemeCurrentApp();
        loadStyleCurrentApp();

        app->setStyleSheet(currentStyleApp);
    }
}
