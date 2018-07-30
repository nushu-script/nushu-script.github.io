#!/usr/bin/env perl
use strict;
use warnings;
use Encode;
use 5.010;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';

my @arr_chars;
my @arr_nushuNo;
my $chars;
my $nushuNo;
Encode::_utf8_on($chars);

sub insert {
    if ($nushuNo) {
        for (0 .. $#arr_chars) {
            if ($arr_chars[$_] eq $&) {
                $arr_nushuNo[$_] .= '|' . $nushuNo;
                return;
            }
        }
        push @arr_chars, $&;
        push @arr_nushuNo, $nushuNo;
    }
}

<STDIN>;  # Skip heading

while (<STDIN>) {
    /^([^\t]*?)\t[^\t]*?\t[^\t]*?\t[^\t]*?\t([^\t]*?)\t[^\t]*?\t[^\t]*?$/;
    $nushuNo = $1;
    $chars = $2;

    while ($chars =~ /./) {
        insert();
        $chars = $';
    }
}

print << 'EOF';
var picMap=
{
EOF

print '"', shift @arr_chars, '":"', shift @arr_nushuNo, '"';

while (@arr_chars) {
    print ",\n\"", shift @arr_chars, '":"', shift @arr_nushuNo, '"';
}

print << 'EOF';

}
EOF
