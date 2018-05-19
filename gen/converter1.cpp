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
    QRegularExpression re("(.*?)\t(.*?)\t.*?\t.*?\t.*?\t.*?");

    RecordList rlist;

    qin.readLine();  // Skip header

    for(;;)
    {
        qin.readLineInto(&line);

        QRegularExpressionMatch match = re.match(line);
        if(!match.hasMatch()) break;
        QString nuchar = match.captured(1);
        QString hanchars = match.captured(2);
        if(hanchars.isEmpty() || hashval.isEmpty()) continue;

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
