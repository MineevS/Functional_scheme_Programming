#include <QCoreApplication>
#include <QtTest>

// add necessary includes here

class QEvalDerivTest : public QObject
{
    Q_OBJECT

public:
    QEvalDerivTest();
    ~QEvalDerivTest();

private slots:
    void initTestCase();
    void cleanupTestCase();
    void test_case1();
};

QEvalDerivTest::QEvalDerivTest() {}

QEvalDerivTest::~QEvalDerivTest() {}

void QEvalDerivTest::initTestCase() {}

void QEvalDerivTest::cleanupTestCase() {}

void QEvalDerivTest::test_case1() {

}

QTEST_MAIN(QEvalDerivTest)

#include "tst_qtester.moc"
