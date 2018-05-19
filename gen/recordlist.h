class RecordList
{
public:
    void insert(const QChar &ch, const QString &hashval)
    {
        bool find = false;
        for(QPair <QChar, QSet <QString>> &lit: list)
        {
            if(lit.first == ch)
            {
                lit.second.insert(hashval);
                find = true;
                break;
            }
        }
        if(!find)
        {
            QSet <QString> newSet;
            newSet.insert(hashval);
            list.push_back(QPair <QChar, QSet <QString>>(ch, newSet));
        }
    }

    void output(QTextStream &qout) const
    {
        QList <QPair <QChar, QSet <QString>>>::const_iterator lcit = list.cbegin();
        {
            qout << '"' << lcit->first << '"' << ':' << '"';
            QSet<QString>::const_iterator scit = lcit->second.cbegin();
            qout << *scit++;
            while(scit != lcit->second.cend())
            {
                qout << '|' << *scit++;
            }
            qout << '"';
            ++lcit;
        }
        while(lcit != list.cend())
        {
            qout << ',' << '\n' << '"' << lcit->first << '"' << ':' << '"';
            QSet<QString>::const_iterator scit = lcit->second.cbegin();
            qout << *scit++;
            while(scit != lcit->second.cend())
            {
                qout << '|' << *scit++;
            }
            qout << '"';
            ++lcit;
        }
        qout << '\n';
    }

private:
    QList <QPair <QChar, QSet <QString>>> list;
};
