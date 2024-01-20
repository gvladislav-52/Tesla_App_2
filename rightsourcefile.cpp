#include "rightsourcefile.h"
#include <QDateTime>
#include <QDebug>
#include <QRandomGenerator>
#include <QString>

RightSourceFile::RightSourceFile(QObject *parent)
    : QObject(parent)
{}

bool RightSourceFile::carLocked() const
{
    return m_carLocked;
}

void RightSourceFile::setcarLocked(bool newCarLocked)
{
    if (m_carLocked == newCarLocked)
        return;
    m_carLocked = newCarLocked;
    emit carLockedChanged();
}

void RightSourceFile::setcarLockeder(bool newCarLocked)
{
    if (m_carLocked == newCarLocked)
        return;
    m_carLocked = newCarLocked;
    emit carLockedChanged();
}
