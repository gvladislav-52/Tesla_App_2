#include "additional_window.h"

additional_window::additional_window()
{
    m_add_window_source = false;
}

bool additional_window::getAdd_window_source() const
{
    return m_add_window_source;
}

void additional_window::setAdd_window_source(bool newAdd_window_source)
{
    if (m_add_window_source == newAdd_window_source)
        return;
    m_add_window_source = newAdd_window_source;
    emit add_window_sourceChanged();
}
