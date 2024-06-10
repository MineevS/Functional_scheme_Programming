/*!
 @file 		 basewindow.h
 @date 		 09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
 @version    v1.0
 @author     Mineev S. A. [mineeff20@yandex.ru]
 @copyright  FreeSoft.
 @brief      Основное объявление графического компонента BaseWindow.
 @details    BaseWindow является базовым окном и содержит необходимый функционал для взаимодействия с guile.
*/

#ifndef BASEWINDOW_H
#define BASEWINDOW_H

#include <QMainWindow>
#include <QButtonGroup>
#include <QString>
#include <QPlainTextEdit>
#include <QTextEdit>
#include <QLineEdit>

#include "expression_builder.h"
#include "qexprwidget.h"
#include "QTelnet.h"

#include <QDebug>

#ifdef Q_OS_LINUX
#include <libguile.h>
#endif

namespace Ui {
class BaseWindow;
}

class BaseWindow : public QMainWindow
{
    Q_OBJECT
public:
    explicit BaseWindow(QWidget *parent = nullptr);
    ~BaseWindow();

    static QLineEdit *result;
    static void* register_functions(void *);

#ifdef Q_OS_LINUX
    static SCM print(SCM msg);
    static SCM deriv(SCM msg);
#endif

    void setFontSize(int size);
    int getFontSize();

    void setFontStyle(QString style_name);
    QString getFontStyle();

public slots:
    void addTextTelnet(const char *msg, int count);
signals:
    void errorMessage(const QString&);

private slots:
    void _q_font_size_changed(int );
    void _q_font_name_changed(const QString& );
    void _q_align_changed(int );
    void _q_text_changed(const QString& );
    void _q_builder_flag_changed(bool);
    void on_btConnect_clicked();

public slots:
    void on_teOutput_textChanged();

private:
    Ui::BaseWindow *ui;
    
    QExprWidget* m_expr_widget;
    QExprWidget* m_expr_widget_deriv;
    std::unique_ptr<MathExpressions::AbstractExpression> m_expression;

    QButtonGroup *m_aling_buttons;
    QTelnet *telnet;
    QString input;
};

#endif // BASEWINDOW_H
