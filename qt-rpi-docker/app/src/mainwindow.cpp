#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <sys/utsname.h>
#include <QString>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent),
      ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    struct utsname info;

    QString architecture = "Unknown";

    if (uname(&info) == 0)
        architecture = info.machine;

    ui->architectureLabel->setText(
        "CPU Architecture: " + architecture);

    ui->qtVersionLabel->setText(
        "Qt Version: " + QString(qVersion()));

    ui->buildDateLabel->setText(
        "Build Date: " +
        QString(__DATE__) +
        " " +
        QString(__TIME__));
}

MainWindow::~MainWindow()
{
    delete ui;
}