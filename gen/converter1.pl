use strict;
use warnings;
use utf8;
use Encoding;
use 5.010;
binmode STDOUT, ':utf8';

my @arr_chars;
my @arr_nushu;
my $chars;
my $nushu;

sub insert
{
    if(!$nushu)
    {
        return;
    }
    for(my $i = 0; $i <= $#arr_chars; $i++)
    {
        if($arr_chars[$i] eq $&)
        {
            $arr_nushu[$i] = $arr_nushu[$i] . $nushu;
            return;
        }
    }
    push(@arr_chars, $&);
    push(@arr_nushu, $nushu);
}

<STDIN>;
while(<STDIN>)
{
    /^(.*?)\t(.*?)\t.*?\t.*?\t.*?\t.*?$/;
    $nushu = $1;
    $chars = $2;

    Encode::_utf8_on($nushu);
    Encode::_utf8_on($chars);

    while($chars =~ /./)
    {
        insert();
        $chars = $';
    }
}

print << 'EOF';
var mappingnushuchar=
{
EOF

print '"', $arr_chars[0], '":"', $arr_nushu[0], '"';

for(my $i = 1; $i <= $#arr_chars; $i++)
{
    print ",\n\"", $arr_chars[$i], '":"', $arr_nushu[$i], '"';
}

print << 'EOF';

}
EOF
