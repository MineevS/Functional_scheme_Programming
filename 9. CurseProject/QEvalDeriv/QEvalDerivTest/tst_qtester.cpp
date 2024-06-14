/*!
 @file 		main.cpp
 @date 		09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
 @version   v1.0
 @author 	Mineev S. A. [mineeff20@yandex.ru]
 @copyright FreeSoft.
 @brief     Содержит точку входа в программу
 @details   Отсутсвуют
*/

#include <QCoreApplication>
#include <QtTest>

#include <stdlib.h>

#include <string.h>

// add necessary includes here

#include "qstylizer.h"

#include "mainwindow.h"
#include "basewindow.h"
#include "ui_basewindow.h"

#include "QTelnet.h"

#include <QFile>
#include <QDir>

#include <QFont>

#include <QString>

#include <QThread>

class QEvalDerivTest : public QObject
{
    Q_OBJECT

public:
    QEvalDerivTest();
    ~QEvalDerivTest();

private slots:
    void initTestCase();

        void test_case1_connect_guile_telnet();
        void test_case3_create_exist_fileGuile();
        void test_case4_exist_dir_qss_for_fileCSS();

        void test_case5();
        void test_case6();
        void test_case7();
        void test_case8();

    void cleanupTestCase();

private:
    MainWindow *mw;
    BaseWindow *bw;

    // QTelnet* telnet;
};

QEvalDerivTest::QEvalDerivTest() {
    QCoreApplication::setOrganizationName(ORGANIZATION_NAME);
    QCoreApplication::setOrganizationDomain(ORGANIZATION_DOMAIN);
    QCoreApplication::setApplicationName(APPLICATION_NAME);
    qApp->setProperty("settingsApp", QVariant::fromValue(new Settings()));

    mw = new MainWindow();
    bw = new BaseWindow();
}

QEvalDerivTest::~QEvalDerivTest() {
    delete mw;
    delete bw;
}

void QEvalDerivTest::initTestCase() {
    mw->connectGuile(); // Запуск сервера Guile.

    Q_ASSERT(mw->getStatusGuileConnect() == true); // Подключение к Guile;
}

void QEvalDerivTest::test_case1_connect_guile_telnet(){ // Удалось ли установить подключение к guile по telnet ?

    bw->on_btConnect_clicked();

    QVERIFY(bw->getTelnet()->waitForConnected(1000));

    QVERIFY(bw->getTelnet()->waitForReadyRead(3000));

    // qDebug() << "TextPlain: " << bw->getTextPlain();

    Q_ASSERT(bw->getStatusConnectTelnet() == true);
}

void QEvalDerivTest::test_case3_create_exist_fileGuile(){
    mw->createFileGuile(); // Предварительно создаем файл guile.scm; ( В случае наличия перезапишится, в случае отсутствия создаться!)
    Q_ASSERT(mw->existGuileFile(DEFAULT_FILE_GUILE_NAME)== true); // Проверка существования файла 'guile.scm';
}

void QEvalDerivTest::test_case4_exist_dir_qss_for_fileCSS(){
    Q_ASSERT(QDir().exists("qss")== true); // // Проверка существу ли дирректория для расположения файлов стилей ?
}

void QEvalDerivTest::test_case5(){ // Тест на настройку размера шрифта;
    int size = 18;
    bw->setFontSize(size);
    Q_ASSERT(bw->getFontSize() == size);
}

void QEvalDerivTest::test_case6(){ // Тест на настройку стиля шрифта;
    QString style_name = "MathJax_Main";
    bw->setFontStyle(style_name);

    QCOMPARE(bw->getFontStyle(), style_name);
}

void QEvalDerivTest::test_case7(){ // Тест на вычисление производной;

    //bw->getTelnet()->sendData(QString("(print (deriv sin ( t ) ))").toLatin1() + '\n');

    //QVERIFY(bw->getTelnet()->waitForBytesWritten(2000));

    // QThread::msleep(3000);

    // QVERIFY(bw->getTelnet()->waitForReadyRead(3000));

    //qDebug() << "result: " << bw->getTelnet()->readAll();
}

void QEvalDerivTest::test_case8(){ // Отключение guile;
    //emit bw->click_disconnect_telnet();

    bw->on_btConnect_clicked();

    //QVERIFY(bw->getTelnet()->waitForDisconnected(1000) == true); // Не требуется!

    bool status = bw->getStatusConnectTelnet();

    // qDebug() << status;

    Q_ASSERT(status == false);
}

void QEvalDerivTest::cleanupTestCase() {
    mw->disconnectGuile();

    bool status = mw->getStatusGuileConnect();

    Q_ASSERT(status == false); // Отключение от Guile;
}


QTEST_MAIN(QEvalDerivTest)

#include "tst_qtester.moc"

