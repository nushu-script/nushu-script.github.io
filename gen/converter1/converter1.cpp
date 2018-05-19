#include <QTextStream>
#include <QString>
#include <QSet>
#include <QRegularExpression>

class RecordList1
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
                qout << *scit++;
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
                qout << *scit++;
            }
            qout << '"';
            ++lcit;
        }
        qout << '\n';
    }

private:
    QList <QPair <QChar, QSet <QString>>> list;
};

int main()
{
    freopen("../../data.txt", "r", stdin);
    freopen("../../util/converter1.js", "w", stdout);

    QTextStream qin(stdin, QIODevice::ReadOnly);
    QTextStream qout(stdout, QIODevice::WriteOnly);
    qin.setCodec("UTF-8");
    qout.setCodec("UTF-8");
    QString line;
    QRegularExpression re("(.*?)\t(.*?)\t.*?\t.*?\t.*?\t.*?");

    RecordList1 rlist;

    qin.readLine();  // Skip heading

    for(;;)
    {
        qin.readLineInto(&line);

        QRegularExpressionMatch match = re.match(line);
        if(!match.hasMatch()) break;
        QString nuchar = match.captured(1);
        QString hanchars = match.captured(2);
        if(nuchar.isEmpty() || hanchars.isEmpty()) continue;

        for(const QChar &ch: hanchars)
        {
            rlist.insert(ch, nuchar);
        }
    }

    qout << "var mappingnushuchar=\n{\n";
    rlist.output(qout);
    qout << '}' << endl;

    return 0;
}
