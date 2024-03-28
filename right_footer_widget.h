#ifndef RIGHT_FOOTER_WIDGET_H
#define RIGHT_FOOTER_WIDGET_H
#include <QObject>

class Right_Footer_Widget : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int leftTemperature READ getLeft_Temparate WRITE setLeft_Temparate NOTIFY
                   left_TemparateChanged FINAL)
    Q_PROPERTY(int rightTemperature READ getRight_Temparate WRITE setRight_Temparate NOTIFY
                   right_TemparateChanged FINAL)
    Q_PROPERTY(int soundTemp READ soundTemp WRITE setSoundTemp NOTIFY soundTempChanged FINAL)

    Q_PROPERTY(QVector<bool> bool_temp_button READ getBool_temp_button WRITE setBool_temp_button
                   NOTIFY bool_temp_buttonChanged FINAL)
    Q_PROPERTY(bool muted_music READ muted_music WRITE setMuted_music NOTIFY muted_musicChanged FINAL)

public:
    explicit Right_Footer_Widget(QObject *parent = nullptr);
    int getLeft_Temparate() const;
    void setLeft_Temparate(int newLeftTemperature);
    int getRight_Temparate() const;
    void setRight_Temparate(int newRightTemperature);

    int soundTemp() const;
    void setSoundTemp(int newSoundTemp);

    QVector<bool> getBool_temp_button() const;
    void setBool_temp_button(const QVector<bool> &newBool_temp_button);

    bool muted_music() const;
    void setMuted_music(bool newMuted_music);

signals:
    void left_TemparateChanged();
    void right_TemparateChanged();

    void soundTempChanged();

    void bool_temp_buttonChanged();

    void muted_musicChanged();

private:
    int m_left_Temparate;
    int m_right_Temparate;
    int m_soundTemp;

    QVector<bool> m_bool_temp_button;

    bool m_muted_music;

public slots:
    void setLeft_SlotPlus();
    void setLeft_SlotMinus();

    void setRight_SlotPlus();
    void setRight_SlotMinus();

    void setSound_SlotPlus();
    void setSound_SlotMinus();
};

#endif // RIGHT_FOOTER_WIDGET_H
