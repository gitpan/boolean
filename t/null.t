use Test::More tests => 11;
use strict;
use blib;

use boolean 'null', 'isNull', 'isBoolean';

ok defined &null, 'null is exported';
ok defined &isNull, 'isNull is exported';
ok defined &isBoolean, 'isBoolean is exported';
ok not(defined &true), 'true is not exported';
ok not(defined &false), 'false is not exported';

is null, undef, 'null == undef';
ok isNull(null), 'null isNull';
ok isNull(undef), 'undef isNull';

my @x; $x[4] = 42;
ok not(isNull($x[0])), 'Empty but allocated array elements are not null';

ok not(isBoolean(null)), 'null is not Boolean';
ok not(isBoolean(undef)), 'undef is not Boolean';
