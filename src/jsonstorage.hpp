#ifndef JSONSTORE_HPP
#define JSONSTORE_HPP

#include <QObject>

namespace sailedger {
    class JsonStorage : public QObject {
        Q_OBJECT
    public:
        explicit JsonStorage(QObject *parent = 0);
        virtual ~JsonStorage();
        Q_INVOKABLE bool save_json(const QString &json);
        Q_INVOKABLE QString load_json();

    private:
        QString m_file_name;
    };
}

#endif // JSONSTORE_HPP
