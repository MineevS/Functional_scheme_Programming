/*!
 @file 		 mainwindow.h
 @date 		 09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
 @version    v1.0
 @author     Mineev S. A. [mineeff20@yandex.ru]
 @copyright  FreeSoft.
 @brief      Содержит объявление графичесокго компонента MainWindow.
 @details    Является вложением в AMainWindow и отображает преведственное окно программы.
*/

#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

#ifdef Q_OS_LINUX
#include <libguile.h>
#endif

#include "amainwindow.h"

#include "../CREATE_FILES/CREATE_FILES.h"
#include "basewindow.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public AMainWindow
{
    Q_OBJECT
public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

    bool connectGuile(){
#ifdef Q_OS_LINUX
        scm_with_guile(&BaseWindow::register_functions, NULL);
        SCM result;

        scm_c_eval_string("(use-modules (system repl server))");                     // RESULT: #<unspecified>;
        result = scm_c_eval_string("(spawn-server)"); // Запуск(Пораждение) сервера; // RESULT: #<thread 140168065054400 (7f7b7c152900)>

        if(result){
            guile_actuve = true;
        } else {
            guile_actuve = false;
        }

        return guile_actuve;
#endif
    }
	
	bool disconnectGuile(){
        scm_c_eval_string("(stop-server-and-clients!)");
        guile_actuve = false;
        return guile_actuve;
    }
	
	bool getStatusGuileConnect(){
        return guile_actuve;
    }

    bool existGuileFile(const QString file){
        return QFile::exists(file);
    }

    void loadCodeSchemeInGuile(){
#ifdef Q_OS_LINUX
        scm_c_primitive_load(DEFAULT_FILE_GUILE_NAME); // "guile.scm"
#endif
    }

    bool createFileGuile(){
        QFile file(DEFAULT_FILE_GUILE_NAME);
        if(!file.open(QIODevice::ReadWrite | QIODevice::Text)) // | QIODevice::Truncate
            return false;
        QTextStream out(&file);
        out << DEFAULT_FILE_GUILE_CONTENT;
        file.close();

        return true;
    }

private:
    Ui::AMainWindow *ui_amw;
    Ui::MainWindow  *ui_mw;
    Ui::BaseWindow  *ui_bw;

    bool guile_actuve = false;

    QMetaObject::Connection conn; // Обязательно делаем приватным!
    QMetaObject::Connection conn_close; // Обязательно делаем приватным!

    BaseWindow *wb;

    QMetaObject::Connection conn_packet;
    QMetaObject::Connection conn_cgramm;
    QMetaObject::Connection conn_run;
    QMetaObject::Connection conn_drun;
    QMetaObject::Connection conn_stat;
};

#endif // MAINWINDOW_H
