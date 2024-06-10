/*!
 @file 		 basewindow.cpp
 @date 		 09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
 @version    v1.0
 @author     Mineev S. A. [mineeff20@yandex.ru]
 @copyright  FreeSoft.
 @brief      Содержит реализацию графического компонента BaseWindow.
 @details    BaseWindow является базовым окном и содержит необходимый функционал для взаимодействия с guile.
*/

#include "basewindow.h"
#include "ui_basewindow.h"

#include <QCheckBox>
#include <QToolButton>
#include <QButtonGroup>
#include <QScrollBar>
#include <QTextBlock>
#include <QVariant>
#include <QString>

QLineEdit* BaseWindow::result = NULL;

BaseWindow::BaseWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::BaseWindow)
{
    ui->setupUi(this);
    ui->teOutput->setUndoRedoEnabled(true);

    telnet = new QTelnet(this);

    result = new QLineEdit(this);
    result->setAlignment(Qt::AlignmentFlag::AlignHCenter);

    ui->label_3->setObjectName("labelClassB");
    ui->label_4->setObjectName("labelClassB");
    ui->label_5->setObjectName("labelClassB");

    m_expr_widget = new QExprWidget(this);
    m_expr_widget->setAlignment(Qt::AlignCenter);
    m_expr_widget->setFixedHeight(150);

    ui->lay_left->insertWidget(0, m_expr_widget);
    ui->lay_left->addWidget(result);
    ui->lay_left->setContentsMargins(5, 5, 5, 5);
    ui->lay_left->setSpacing(10);

    connect(result, &QLineEdit::textChanged, this, &BaseWindow::_q_text_changed);
    connect(ui->axisX, &QCheckBox::clicked, m_expr_widget, &QExprWidget::setVisibleAxisX);
    connect(ui->axisY, &QCheckBox::clicked, m_expr_widget, &QExprWidget::setVisibleAxisY);
    connect(ui->m_font_name, &QFontComboBox::currentTextChanged, this, &BaseWindow::_q_font_name_changed);
    connect(ui->m_font_size, SIGNAL(valueChanged(int)), this, SLOT(_q_font_size_changed(int)));

    connect(telnet, SIGNAL(newData(const char*,int)), this, SLOT(addTextTelnet(const char*,int)) );

    setProperty("textA", ">");
}

BaseWindow::~BaseWindow(){
    delete ui;
}

void BaseWindow::_q_font_size_changed(int size){
    if (m_expression) {
        QFont font = m_expression->font();
        font.setPointSize(size);
        m_expression->setFont(font);
        m_expr_widget->repaint();
    }

}

void BaseWindow::_q_font_name_changed(const QString &name){
    if (m_expression) {
        QFont font = m_expression->font();
        font.setFamily(name);
        m_expression->setFont(font);
        m_expr_widget->repaint();
    }
}

void BaseWindow::_q_align_changed(int align){
    QAbstractButton* button = m_aling_buttons->button(align);
    if (button && button->isChecked())
        m_expr_widget->setExpressionAlignment( Qt::Alignment(align));
}

void BaseWindow::_q_text_changed(const QString &text){
    MathExpressions::ExpressionBuilder builder;
    QFont font;
        font.setFamily(ui->m_font_name->currentText());
        font.setPointSize(ui->m_font_size->value());
    QString _text = text;

    m_expression = builder.exec(_text.replace(QChar(' '), QChar('&')));
    m_expression->setFont(font);

    m_expr_widget->setExpression(m_expression.get());

    if (builder.lastError().isValid()) {
        emit errorMessage(builder.lastError().text());
        QString str;
        str.reserve(builder.lastError().position());
        for (int i = 1; i < builder.lastError().position(); ++i) {
            str.append(' ');
        }
        str.append('^');
    }
    else
        qDebug() << "No error";
}

void BaseWindow::_q_builder_flag_changed(bool){
    _q_text_changed(result->text());
}

void BaseWindow::addTextTelnet(const char *msg, int count){
    ui->teOutput->insertPlainText( QByteArray(msg, count) );
    ui->teOutput->verticalScrollBar()->setValue(0xFFFFFFF);
}

void BaseWindow::on_btConnect_clicked(){
    if(telnet->isConnected())
       telnet->disconnectFromHost();
    else
       telnet->connectToHost(ui->leAddr->text(), ui->sbPort->value());
    ui->teOutput->clear();
    setProperty("text", ""); // Сброс обязателен.
}

void BaseWindow::on_teOutput_textChanged(){
    QTextBlock text = ui->teOutput->document()->findBlockByNumber(ui->teOutput->blockCount() - 1);

    if(property("textA").toString().compare(text.text()) == 0) { ui->teOutput->insertPlainText("> ") ; return;}// Не позволяем очищать шапку консоли!

    if(text.text().split(">").count() > 1){
        setProperty("textA", text.text().split(">")[0]);//+ ">"
        QString str = text.text().split(">")[1];
        if(str.size() > 0 && str[0]=='('){
            setProperty("text", str);
        }else
            setProperty("text", str.remove(0, 1));
    }else {
        qDebug() << text.text();
    }

    if(text.text().isEmpty()){
        if(property("text").toString().compare("(clear)") == 0){
            setProperty("text", ""); // Сброс обязателен.
            ui->teOutput->setPlainText(property("textA").toString() + ">");
            ui->teOutput->moveCursor(QTextCursor::End);
        }
        else if(telnet->isConnected()){
            telnet->sendData(property("text").toString().toLatin1());
            telnet->sendData("\n");
        }
    }
}
// ----------------------------------------------------------------------------------------//

#ifdef Q_OS_LINUX

SCM BaseWindow::print(SCM msg){
    QString res = scm_to_locale_string(msg);
    result->setText(res.remove(' '));//BaseWindow::
    return SCM_UNSPECIFIED;
}

SCM BaseWindow::deriv(SCM msg){
    scm_to_locale_string(msg);
    return SCM_UNSPECIFIED;
}

void BaseWindow::setFontSize(int size){
    ui->m_font_size->setValue(size);
}

int BaseWindow::getFontSize(){
    return ui->m_font_size->value();
}

void BaseWindow::setFontStyle(QString style_name){
    ui->m_font_name->setCurrentText(style_name);
}

QString BaseWindow::getFontStyle(){
    return ui->m_font_name->currentText();
}

void* BaseWindow::register_functions(void*){
    scm_c_define_gsubr("print", 1, 0, 0, (scm_t_subr)&print);
    //scm_c_define_gsubr("deriv", 1, 0, 0, (scm_t_subr)&deriv);

    return NULL;
}

#endif

