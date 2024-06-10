/*!
 @file       qexprwidget.h
 @date       09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
 @version    v1.0
 @author     Mineev S. A. [mineeff20@yandex.ru]
 @copyright  FreeSoft.
 @brief      Содержит объявление графического компонента QExperWidget.
 @details    QExperWidget предназначен для отображения результатов QMahExpr.
*/

#ifndef EXPRESSIONWIDGET_H
#define EXPRESSIONWIDGET_H

#include <QtWidgets/QWidget>

namespace MathExpressions {
  class AbstractExpression;
}

typedef MathExpressions::AbstractExpression* ExpressionPtr;

class QExprWidget : public QWidget
{
  Q_OBJECT
public:
  explicit QExprWidget(QWidget *parent = nullptr);

public slots:
  void setVisibleAxisX(bool value);
  void setVisibleAxisY(bool value);
  void setExpression(ExpressionPtr );
  void setExpressionAlignment(Qt::Alignment alignment);
  void setAlignment(Qt::Alignment alignment);

protected:
  void paintEvent(QPaintEvent *event);

private:
  bool m_show_axis_x = false;
  bool m_show_axis_y = false;

  ExpressionPtr m_expression = nullptr;
  Qt::Alignment m_expression_alignment;
  Qt::Alignment m_alignment;

  void paintAxiss();
  void paintExpression();
};

#endif // EXPRESSIONWIDGET_H
