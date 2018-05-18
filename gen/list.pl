use strict;
print "<style type=text/css>\nnushu{text-align:center;font-family:TH-Tshyn-P1;font-size:200%;}\n</style>\n\n";
print "| 图片 | 女书字符 | 汉字 | 《字帖》序 | 土话代表发音 | 备注 |\n";
print "| --- | --- | --- | --- | --- | --- |\n";
my $line = <STDIN>;
while(my $line = <STDIN>)
{
    print $line =~ s/^(.*?)\t(.*?)\t(.*?)\t(.*?)\t(.*?)\t(.*?)$/| ![$1]($5.jpg) | \<nushu\>$1\<\/nushu\> | $2 | $3 | $4 | $6 |/r;
}
