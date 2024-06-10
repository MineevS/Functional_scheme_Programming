/*!
 @file 		mainwindow.h
 @date 		09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
 @version    v1.0
 @author     Mineev S. A. [mineeff20@yandex.ru]
 @copyright  FreeSoft.
 @brief      Основное графическое окно программы.
 @details    Является вложением в AMainWindow.
*/

#include "ui_amainwindow.h"
#include "amainwindow.h"

#include <QGraphicsDropShadowEffect>
#include <QPainter>
#include <QPainterPath>
#include <QCursor>
#include <QApplication>

#include "settings.h"

//#include <QtSystemDetection>

AMainWindow::AMainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::AMainWindow)
{
    ui->setupUi(this);

#ifdef Q_OS_WIN // Для win отключаем рамку по умолчанию и определяем свое собственное оформление полностью.
    setWindowFlags(windowFlags() | Qt::WindowType::FramelessWindowHint);
#elif defined(Q_OS_LINUX) // Для linux не переопределяем оформление внешней рамки и не реализуем доп. обработчики кнопок окон.
    // TODO:
#endif
    setWindowTitle("QEvalDerivSys");
    setStyle(QStyleFactory::create("Fusion"));

    Settings* settings = qApp->property("settingsApp").value<Settings*>();

    wsettings = new WSettings(this);
    sldBtn = new QSliderButton(this, settings->GetStatus());

    connect(sldBtn, &QSliderButton::click, settings, &Settings::changeTheme);
    
    ui->horizontalLayout->insertWidget(1, sldBtn, 0, Qt::AlignmentFlag::AlignVCenter);
    setCursor(_cursor);
#ifdef Q_OS_WIN
    // Обработчик закрытия окна:
    connect(ui->toolButton, SIGNAL(clicked()), this, SLOT(close()));
    /*
     * ui->toolButton испускает сигнал clicked(). Метод close() наследуемый компонентом this [amainwindow] от QMainWindow закрывает окно.
     * Т. к. закрывается абстрактный класс, до и наследуемый класс тоже закрывается.
    */

    // Обработчик расширения/сужения окна окна:
    connect(ui->toolButton_2, SIGNAL(clicked()), this, SLOT(collapse()));
    // Обработчик сворачивания окна:
    connect(ui->toolButton_3, SIGNAL(clicked()), this, SLOT(collapse2()));
#elif defined(Q_OS_LINUX)
    ui->btn_close->hide();
    ui->btn_collapse_expand->hide();
    ui->btn_hide->hide();
#endif
    // обработчик запуска окна настроек программы
    connect(ui->tb_settings, SIGNAL(clicked(bool)), this, SLOT(changeSettings()));

    ui->close->hide();
}

void AMainWindow::paintEvent(QPaintEvent * event){
    Q_UNUSED(event);
    QPainter painter(this);
    painter.setRenderHint (QPainter::Antialiasing);
    painter.setBrush(QColor(0, 0, 0, 100));
    painter.setPen(Qt::PenStyle::NoPen);
    painter.setOpacity(0.5);

    QString offColor = "#ffffff";//#000000
    QString aoffColor = offColor;
    QColor mainColorOff = QColor(aoffColor);
    QColor subColorOff = QColor(aoffColor);

    QLinearGradient linearGrad(QPointF(0, this->width() / 2), QPointF(0, this->height() / 2));
    linearGrad.setColorAt(0, subColorOff);
    linearGrad.setColorAt(1, mainColorOff);

    painter.setBrush(linearGrad);
    painter.drawRect(rect());
}

void AMainWindow::mousePressEvent(QMouseEvent *event){
    QMainWindow::mousePressEvent(event);
}

void AMainWindow::mouseMoveEvent(QMouseEvent *event){
    QMainWindow::mouseMoveEvent(event);
}

void AMainWindow::mouseReleaseEvent(QMouseEvent *event){
    QMainWindow::mouseReleaseEvent(event);
}

AMainWindow::~AMainWindow(){
    if(wsettings != nullptr) delete  wsettings;
    delete sldBtn;
}
