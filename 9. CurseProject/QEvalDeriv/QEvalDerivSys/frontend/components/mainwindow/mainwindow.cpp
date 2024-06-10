/*!
 @file 		 mainwindow.cpp
 @date 		 09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
 @version    v1.0
 @author     Mineev S. A. [mineeff20@yandex.ru]
 @copyright  FreeSoft.
 @brief      Содержит реализацию графического компонента MainWindow.
 @details    Является вложением в AMainWindow и отображает преведственное окно программы.
*/

#include "mainwindow.h"
#include "ui_amainwindow.h"
#include "ui_mainwindow.h"
#include "ui_basewindow.h"

#include <QDebug>
#include <QFileDialog>
#include <QFile>

MainWindow::MainWindow(QWidget *parent)
    : AMainWindow(parent)
    , ui_amw(GetUI()), ui_mw(new Ui::MainWindow){ //ui_bw(new Ui::BaseWindow)
    QMainWindow* qmv = new QMainWindow(); // Посредник между внешним ui_amw и вложенным в него ui_mw;
    qmv->setWindowFlags(Qt::Widget);
    qmv->setObjectName("qmv");
    ui_mw->setupUi(qmv); // Можно установить только в QMainWindow;
    ui_amw->gridLayout->addWidget(qmv, 0, 0, 1, 1);
    conn_run = connect(ui_mw->button_run, &QToolButton::clicked, [this](){
        BaseWindow *wb = new BaseWindow();
        wb->setObjectName("wb");

        ui_amw->gridLayout->parentWidget()->findChild<QMainWindow*>("qmv")->hide(); // Внутри lambda функций нельзя обращаться непосредственно к виджетам через явное использование qmv. Только с помощью поиска!
        ui_amw->gridLayout->addWidget(wb, 0, 0, 1, 1);
        if(!guile_actuve){ // Один раз регистрируем guile!
            // Реализовать проверку наличия guile.scm; // Если не существует, то попытаться создать или выдать сообщение о невозможности создать файл!
            if(connectGuile()) ui_amw->status_bar->setText("Программе удалось подключиться к Guile!");
            else ui_amw->status_bar->setText("Программе не удалось подключиться к Guile!");

            if(existGuileFile(DEFAULT_FILE_GUILE_NAME)) // Файл `guile.scm` существует;
                loadCodeSchemeInGuile();
            else { // Файл `guile.scm` не существует;
                if(createFileGuile()) loadCodeSchemeInGuile();
                else ui_amw->status_bar->setText("Не удалось создать файл guile.scm! Проверьте доступна ли дериктория для записи и есть ли свободное место на диски!");
            }
        }

        ui_amw->close->show();
        conn = connect(ui_amw->close, &QToolButton::clicked, [this](){
            ui_amw->close->hide();
            ui_amw->gridLayout->removeWidget(ui_amw->gridLayout->parentWidget()->findChild<BaseWindow*>("wb"));
            ui_amw->gridLayout->parentWidget()->findChild<BaseWindow*>("wb")->deleteLater();
            ui_amw->gridLayout->parentWidget()->findChild<QMainWindow*>("qmv")->show();
            disconnect(conn);
        });
    });

    connect(ui_mw->create_guile, &QToolButton::clicked, [this](){
        createFileGuile();
    });

    connect(ui_mw->create_firstTheme, &QToolButton::clicked, [this](){
        QDir dir("qss");
        if (!dir.exists())
            dir.mkpath(".");
        QFile file(DEFAULT_FILE_FIRSTTHEME_NAME);
        if(!file.open(QIODevice::ReadWrite | QIODevice::Text))
            return;
        QTextStream out(&file);
        out << DEFAULT_FILE_FIRSTTHEME_CONTENT;
        file.close();
    });

    connect(ui_mw->create_secondTheme, &QToolButton::clicked, [this](){
        QDir dir("qss");
        if (!dir.exists())
            dir.mkpath(".");
        QFile file(DEFAULT_FILE_SECONDTHEME_NAME);
        if(!file.open(QIODevice::ReadWrite | QIODevice::Text))
            return;
        QTextStream out(&file);
        out << DEFAULT_FILE_SECONDTHEME_CONTENT;
        file.close();
    });
}

MainWindow::~MainWindow(){
    delete ui_amw;
    delete ui_mw;
}


