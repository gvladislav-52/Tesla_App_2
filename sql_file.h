#ifndef SQL_FILE_H
#define SQL_FILE_H

#include <QObject>
#include <QSqlDatabase>
#include <QtSql>
#include <QSqlTableModel>

class sql_file: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name_dataBase READ name_dataBase WRITE setName_dataBase NOTIFY name_dataBaseChanged FINAL)

public:
    sql_file();
    void add_query_function(QString first_name, QString login, QString password);
    void del_query_function(int id);
    void select_query_function();
    void clear_query_function();
    void search(QString login,QString password);
    QString name_dataBase() const;
    void setName_dataBase(const QString &newName_dataBase);

signals:
    void name_dataBaseChanged();

private:
    QSqlDatabase db;
    QString m_name_dataBase;
};

#endif // SQL_FILE_H
