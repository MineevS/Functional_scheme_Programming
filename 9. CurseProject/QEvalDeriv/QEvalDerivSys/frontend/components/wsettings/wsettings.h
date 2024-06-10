/*!
 @file 		wsettings.h
 @date 		09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
 @version   v1.0
 @author 	Mineev S. A. [mineeff20@yandex.ru]
 @copyright FreeSoft.
 @brief     Содержит объявление графического компонента WSettings.
 @details   WSettings является окном установки настройки оформления приложения.
*/

#ifndef WSETTINGS_H
#define WSETTINGS_H

#include <QMainWindow>
#include <QColorDialog>
#include <QStyleFactory>
#include <QToolButton>

#include "qstylizer.h"
#include "settings.h"
#if defined(INCLUDE_SETTINGS)
#include "qttreepropertybrowser.h"
#endif

namespace Ui {
class WSettings;
}

class WSettings : public QMainWindow
{
    Q_OBJECT
public:
    explicit WSettings(QWidget *parent = nullptr);

    ~WSettings();

public slots:
    void expanded(){
        setWindowState(windowState() ^ Qt::WindowState::WindowFullScreen);
    }

    void collapse2(){
        setWindowState(windowState() ^ Qt::WindowState::WindowMinimized);
    }

    void updateCurrentTheme(){
        Settings* settings = qApp->property("settingsApp").value<Settings*>();

        if(settings->getCurrentThemeApp().compare("theme_first") == 0){
            qApp->setStyleSheet(stylizer->styleSheetFromQMap(currentStyleFirstTheme));
        }else{
            qApp->setStyleSheet(stylizer->styleSheetFromQMap(currentStyleSecondTheme));
        }
    }

private:
    Ui::WSettings   *ui;

    QStylizer* stylizer;

#if defined(INCLUDE_SETTINGS)
    QtTreePropertyBrowser *browser;
#endif

    QMap<QString, QMap<QString, QMap<QString, QString>>> currentStyleFirstTheme;
    QMap<QString, QMap<QString, QMap<QString, QString>>> currentStyleSecondTheme;
};

#endif // WSETTINGS_H
