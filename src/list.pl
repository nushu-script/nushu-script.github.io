use strict;
use warnings;
use 5.010;

print '# Unicode Nushu List / Unicode 女书一览表

Version / 版本：20180528

If you cannot see the Nushu charcater, please download the font TH-Tshyn-P1 in TH-Fonts. / 如果您看不到女书字符，请安装天珩全字库中的 TH-Tshyn-P1 字体。

| 序号 | Unicode 编码 | 女书字符 | 图片 | 《字帖》序 | 对应汉字 | 江永方言代表发音 | 备注 |
| :-: | :-: | :-: | :-: | :-: | :- | :- | :- |
';

binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';

<STDIN>;  # Skip heading

while(<STDIN>) {
    s/^([^\t]*?)\t([^\t]*?)\t([^\t]*?)\t([^\t]*?)\t([^\t]*?)\t([^\t]*?)\t([^\t]*?)$/| $1 | $2 | <span>$3<\/span>{: style="font-family: TH-Tshyn-P1; font-size: 200%;"} | ![$2](.\/glyph\/$1.jpg) | $4 | $5 | $6 | $7 |/;
    print $_;
}
