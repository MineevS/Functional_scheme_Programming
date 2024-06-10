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

// add necessary includes here

#include "qstylizer.h"

#include "mainwindow.h"
#include "basewindow.h"
#include "ui_basewindow.h"

#include <QFile>
#include <QDir>

#include <QFont>

class QEvalDerivTest : public QObject
{
    Q_OBJECT

public:
    QEvalDerivTest();
    ~QEvalDerivTest();

private slots:
    void initTestCase();

    void test_case1_connect_guile();
    void test_case2_create_exist_fileGuile();
    void test_case3_exist_dir_qss_for_fileCSS();

    void test_case4();
    void test_case5();
    void test_case6();

    void cleanupTestCase();

private:
    MainWindow *mw;
    BaseWindow *bw;
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

}

void QEvalDerivTest::test_case1_connect_guile() {
    Q_ASSERT(mw->connectGuile() == true); // Подключение к Guile;
}

void QEvalDerivTest::test_case2_create_exist_fileGuile(){
    mw->createFileGuile(); // Предварительно создаем файл guile.scm; ( В случае наличия перезапишится, в случае отсутствия создаться!)
    Q_ASSERT(mw->existGuileFile(DEFAULT_FILE_GUILE_NAME)== true); // Проверка существования файла 'guile.scm';
}

void QEvalDerivTest::test_case3_exist_dir_qss_for_fileCSS(){
    Q_ASSERT(QDir().exists("qss")== true); // // Проверка существу ли дирректория для расположения файлов стилей ?
}


void QEvalDerivTest::test_case4(){ // Тест на настройку размера шрифта;
    int size = 18;
    bw->setFontSize(size);
    Q_ASSERT(bw->getFontSize() == size);
}

void QEvalDerivTest::test_case5(){ // Тест на настройку стиля шрифта;
    QString style_name = "MathJax_Main";
    bw->setFontStyle(style_name);

    QCOMPARE(bw->getFontStyle(), style_name);
}

void QEvalDerivTest::test_case6(){ // Тест на вычисление производной;

}


void QEvalDerivTest::cleanupTestCase() {

}


QTEST_MAIN(QEvalDerivTest)

#include "tst_qtester.moc"
