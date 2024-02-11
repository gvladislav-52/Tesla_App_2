#include "sql_file.h"

sql_file::sql_file()
{
    db = QSqlDatabase::addDatabase("QPSQL");
    db.setDatabaseName("tesla_app");
    db.setUserName("postgres");
    db.setPassword("8901236767");
    if(!db.open())
        qDebug() << "Error open data base PosgreSQL";
    m_name_dataBase = "None (Click me)";
}

void sql_file::search(QString login,QString password)
{
    QSqlQuery search_query;
    search_query.prepare("SELECT * FROM person_app WHERE login = :login AND password = :password");
    search_query.bindValue(":login", login);
    search_query.bindValue(":password", password);

    if(!search_query.exec())
    {
        qDebug() << "Ошибка выполнения запроса на select";
    }
    if(search_query.next())
            setName_dataBase(search_query.value(3).toString());
    else
        qDebug() << "Логин" << login << "не найден в базе данных";
    emit name_dataBaseChanged();
}

// void sql_file::select_query_function()
// {
//     QSqlQuery selectQuery("SELECT * FROM person_app");
//     while (selectQuery.next()) {
//         QString id = selectQuery.value(0).toString();
//         QString login = selectQuery.value(1).toString();
//         QString password = selectQuery.value(2).toString();
//         QString first_name = selectQuery.value(3).toString();
//         QString created_at = selectQuery.value(4).toString();

//         qDebug() << "id:" << id << "login:" << login << "password:" << password << "first_name:" << first_name << "time:" << created_at;
//     }
// }

// void sql_file::del_query_function(int id_temp)
// {
//     QSqlQuery del_query;

//     del_query.prepare("DELETE FROM person_app WHERE id = :id");
//     del_query.bindValue(":id",id_temp);

//     if(!del_query.exec())
//         qDebug() << "Ошибка выполнения запроса на delete";
// }

// void sql_file::clear_query_function()
// {
//     QSqlQuery clear_query;

//     clear_query.prepare("DELETE FROM person_app");

//     if(!clear_query.exec())
//         qDebug() << "Ошибка выполнения запроса на delete";

//     if (!clear_query.exec("ALTER SEQUENCE person_app_id_seq RESTART WITH 1")) {
//         qDebug() << "Ошибка выполнения запроса на сброс автоинкремента";
//         qDebug() << clear_query.lastError().text();
//     } else {
//         qDebug() << "Автоинкремент успешно сброшен";
//     }
// }

void sql_file::add_query_function(QString first_name_temp, QString login_temp,QString password_temp)
{
    QSqlQuery add_query;

    add_query.prepare("INSERT INTO person_app (login, password, first_name) VALUES (:login, :password, :first_name)");
    add_query.bindValue(":login", login_temp);
    add_query.bindValue(":password", password_temp);
    add_query.bindValue(":first_name", first_name_temp);

    if (!add_query.exec()) {
        qDebug() << "Ошибка выполнения запроса на добавление записи";
        qDebug() << add_query.lastError().text();
    }
}

QString sql_file::name_dataBase() const
{
    return m_name_dataBase;
}

void sql_file::setName_dataBase(const QString &newName_dataBase)
{
    if (m_name_dataBase == newName_dataBase)
        return;
    m_name_dataBase = newName_dataBase;
    emit name_dataBaseChanged();
}
