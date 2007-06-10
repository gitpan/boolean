use Test::More tests => 20;
use strict;
use blib;

use boolean ':all', 'null', 'isNull';

ok true, 'true is defined and works';
ok not(false), 'false is defined and works';

ok isTrue(true), "isTrue works with true";
ok isFalse(false), "isFalse works false";

ok not(isTrue(false)), "isTrue not true with false";
ok not(isFalse(true)), "isFalse not true with true";

is null, undef, 'null == undef';
ok isNull(null), 'null isNull';
ok isNull(undef), 'undef isNull';

my @x; $x[4] = 42;
ok not(isNull($x[0])), 'Empty but allocated array elements are not null';

ok isBoolean(true), 'true isBoolean';
ok isBoolean(false), 'false isBoolean';
ok not(isBoolean(null)), 'null is not Boolean';
ok not(isBoolean(1)), '1 is not Boolean';
ok not(isBoolean(undef)), 'undef is not Boolean';

ok not(isTrue(1)), '1 is not True';
ok not(isTrue(42)), '42 is not True';

ok not(isFalse(undef)), 'undef is not True';
ok not(isFalse("")), '"" is not True';

ok isBoolean(isFalse(isFalse(undef))), 'boolean return values are boolean';
