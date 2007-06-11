use Test::More tests => 22;
use strict;
use blib;

use boolean ':all';

ok defined &true, 'true is exported';
ok defined &false, 'false is exported';
ok defined &isTrue, 'isTrue is exported';
ok defined &isFalse, 'isFalse is exported';
ok defined &isBoolean, 'isBoolean is exported';
ok not(defined &null), 'null is not exported';
ok not(defined &isNull), 'isNull is not exported';

ok true, 'true is defined and works';
ok not(false), 'false is defined and works';

ok isTrue(true), "isTrue works with true";
ok isFalse(false), "isFalse works false";

ok not(isTrue(false)), "isTrue not true with false";
ok not(isFalse(true)), "isFalse not true with true";

ok isBoolean(true), 'true isBoolean';
ok isBoolean(false), 'false isBoolean';
ok not(isBoolean(1)), '1 is not Boolean';
ok not(isBoolean(undef)), 'undef is not Boolean';

ok not(isTrue(1)), '1 is not True';
ok not(isTrue(42)), '42 is not True';

ok not(isFalse(undef)), 'undef is not True';
ok not(isFalse("")), '"" is not True';

ok isBoolean(isFalse(isFalse(undef))), 'boolean return values are boolean';
