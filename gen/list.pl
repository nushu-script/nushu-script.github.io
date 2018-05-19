use strict;
use warnings;

print << 'EOF';
<!doctype html>
<html>
<head>
 <meta charset="utf-8">
 <title>Unicode 女书一览表</title>
 <style type="text/css">
  table{
   border-collapse: collapse;
   text-align:center;
  }
  th,td{
   border:1px solid;
   max-width:250px;
  }
 </style>
</head>
<body id="container" class="export export-html" background=../gif/v2_bcg014.gif>

<h1>Unicode Nushu List / Unicode 女书一览表</h1>
<p>Version / 版本：20180513</p>
<p>If you cannot see the Nushu charcater, please download the font TH-Tshyn-P1 in <a href="http://cheonhyeong.com/English/download.html">TH-Fonts</a>. / 如果您看不到女书字符，请安装<a href="http://cheonhyeong.com/Simplified/download.html">天珩全字库</a>中的 TH-Tshyn-P1 字体。</p>

<table>
<thead>
<tr>
<th>图片</th>
<th>女书字符</th>
<th>汉字</th>
<th>《字帖》序</th>
<th>土话代表发音</th>
<th>备注</th>
</tr>
</thead>
<tbody>
EOF

my $line = <STDIN>;
while(my $line = <STDIN>)
{
    print $line =~ s/^(.*?)\t(.*?)\t(.*?)\t(.*?)\t(.*?)\t(.*?)$/<tr>
<td><img width=20 alt=\"$1\" src=\"..\/glyph\/$5.jpg\"><\/td>
<td style=\"font-family:TH-Tshyn-P1;font-size:200%;\">$1<\/td>
<td>$2<\/td>
<td>$3<\/td>
<td>$4<\/td>
<td>$6<\/td>
<\/tr>/r;
}

print << 'EOF';
</tbody>
</table>
</body>
</html>
EOF
