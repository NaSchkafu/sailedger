#include "jsonstorage.hpp"

#include <QStandardPaths>
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QDir>

namespace sailedger {
JsonStorage::JsonStorage(QObject *parent)
    :QObject(parent), m_file_name(QStandardPaths::writableLocation(QStandardPaths::DataLocation) + "/sailedger.json")
{
    QDir dir(QStandardPaths::writableLocation(QStandardPaths::DataLocation));
    if(!dir.mkpath(".")) {
        qDebug() << "Could not create application path.";
    }
}

JsonStorage::~JsonStorage() { }

QString JsonStorage::load_json() {
    QFile file(m_file_name);
    if(file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream stream(&file);
        return stream.readAll();
    } else {
        qDebug() << file.errorString();
    }

    return "";
}

bool JsonStorage::save_json(const QString &json) {
    QFile file(m_file_name);
    if(file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        file.write(json.toUtf8());
        file.close();
        return true;
    } else {
        qDebug() << file.errorString();
    }

    return false;
}
}

