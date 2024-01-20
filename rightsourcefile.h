#ifndef RIGHTSOURCEFILE_H
#define RIGHTSOURCEFILE_H

#include <QLabel>
#include <QObject>
#include <QQuickWidget>
#include <QTimer>
#include <QVBoxLayout>
#include <QtQuick>

class RightSourceFile : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ carLocked WRITE setcarLocked NOTIFY carLockedChanged FINAL)

public:
    RightSourceFile(QObject *parent = nullptr);
    bool carLocked() const;
    void setcarLocked(bool newCarLocked);
signals:
    void carLockedChanged();

private:
    bool m_carLocked;
public slots:
    void setcarLockeder(bool newCarLocked);
};

#endif // RIGHTSOURCEFILE_H
