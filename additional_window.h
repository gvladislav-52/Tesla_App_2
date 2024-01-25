#ifndef ADDITIONAL_WINDOW_H
#define ADDITIONAL_WINDOW_H

#include <QObject>
class additional_window: public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool add_window_source READ getAdd_window_source WRITE setAdd_window_source NOTIFY add_window_sourceChanged FINAL)
public:
    additional_window();
    bool getAdd_window_source() const;
    void setAdd_window_source(bool newAdd_window_source);
signals:
    void add_window_sourceChanged();
private:
    bool m_add_window_source;
};

#endif // ADDITIONAL_WINDOW_H
