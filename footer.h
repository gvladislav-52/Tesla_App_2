#ifndef FOOTER_H
#define FOOTER_H

#include <QObject>

class footer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int left_Temparate READ left_Temparate WRITE setleft_Temparate NOTIFY
                   left_TemparateChanged FINAL)
    Q_PROPERTY(int right_Temparate READ right_Temparate WRITE setright_Temparate NOTIFY
                   right_TemparateChanged FINAL)
    Q_PROPERTY(int soundTemp READ soundTemp WRITE setSoundTemp NOTIFY soundTempChanged FINAL)
public:
    explicit footer(QObject *parent = nullptr);

    int left_Temparate() const;
    void setleft_Temparate(int newLeft_Temparate);

    int right_Temparate() const;
    void setright_Temparate(int newRight_Temparate);

    int soundTemp() const;
    void setSoundTemp(int newSoundTemp);

signals:
    void left_TemparateChanged();
    void right_TemparateChanged();

    void soundTempChanged();

private:
    int m_left_Temparate;
    int m_right_Temparate;

    int m_soundTemp;

public slots:
    void setLeft_SlotPlus();
    void setLeft_SlotMinus();

    void setRight_SlotPlus();
    void setRight_SlotMinus();

    void setSound_SlotPlus();
    void setSound_SlotMinus();
};

#endif // FOOTER_H
