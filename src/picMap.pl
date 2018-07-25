use strict;
use warnings;
use Encoding;
use 5.010;
binmode STDOUT, ':utf8';

my @arr_chars;
my @arr_hashval;
my $chars;
my $hashval;

sub insert
{
    if($hashval)
    {
        for(0 .. $#arr_chars)
        {
            if($arr_chars[$_] eq $&)
            {
                $arr_hashval[$_] .= '|' . $hashval;
                return;
            }
        }
        push @arr_chars, $&;
        push @arr_hashval, $hashval;
    }
}

<STDIN>;  # Skip heading

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
var picMap=
{
EOF

print '"', shift @arr_chars, '":"', shift @arr_hashval, '"';

while(@arr_chars)
{
    print ",\n\"", shift @arr_chars, '":"', shift @arr_hashval, '"';
}

print << 'EOF';

}
EOF
