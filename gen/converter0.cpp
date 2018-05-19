#include <QTextStream>
#include <QString>
#include <QSet>
#include <QRegularExpression>
#include "recordlist.h"

int main()
{
    freopen("data.txt", "r", stdin);
    freopen("data2.js", "w", stdout);

    QTextStream qin(stdin, QIODevice::ReadOnly);
    QTextStream qout(stdout, QIODevice::WriteOnly);
    qin.setCodec("UTF-8");
    qout.setCodec("UTF-8");
    QString line;
    QRegularExpression re(".*?\t(.*?)\t.*?\t.*?\t(.*?)\t.*?");

    RecordList rlist;

    qin.readLine();  // Skip header

    for(;;)
    {
        qin.readLineInto(&line);

        QRegularExpressionMatch match = re.match(line);
        if(!match.hasMatch()) break;
        QString chars = match.captured(1);
        QString hashval = match.captured(2);
        if(chars.isEmpty() || hashval.isEmpty()) continue;

        for(const QChar &ch: chars)
        {
            rlist.insert(ch, hashval);
        }
    }

    qout << "var mappingnushu=\n{\n";
    rlist.output(qout);
    qout << '}' << endl;

    return 0;
}
