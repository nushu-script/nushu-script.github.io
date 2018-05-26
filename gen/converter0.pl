use strict;
use warnings;
use utf8;
use Encoding;
use 5.010;
binmode STDOUT, ':utf8';

my @arr_chars;
my @arr_hashval;
my $chars;
my $hashval;

sub insert
{
    if(!$hashval)
    {
        return;
    }
    for(my $i = 0; $i <= $#arr_chars; $i++)
    {
        if($arr_chars[$i] eq $&)
        {
            $arr_hashval[$i] = $arr_hashval[$i] . '|' . $hashval;
            return;
        }
    }
    push(@arr_chars, $&);
    push(@arr_hashval, $hashval);
}

<STDIN>;
while(<STDIN>)
{
    /^.*?\t(.*?)\t.*?\t.*?\t(.*?)\t.*?$/;
    $chars = $1;
    $hashval = $2;

    Encode::_utf8_on($chars);

    while($chars =~ /./)
    {
        insert();
        $chars = $';
    }
}

print << 'EOF';
var mappingnushu=
{
EOF

print '"', $arr_chars[0], '":"', $arr_hashval[0], '"';

for(my $i = 1; $i <= $#arr_chars; $i++)
{
    print ",\n\"", $arr_chars[$i], '":"', $arr_hashval[$i], '"';
}

print << 'EOF';

}
EOF
