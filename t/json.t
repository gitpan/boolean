use strict; use warnings;
use Test::More tests => 3;
use boolean -truth;
my $HAVE_JSON = eval { require JSON::MaybeXS };
SKIP: {
    skip "JSON is missing", 3 unless $HAVE_JSON;
    eval{
        my $json = JSON::MaybeXS->new->convert_blessed();
        is($json->encode({false => (0 == 1)}), '{"false":false}',
            'JSON false works');
        is($json->encode({true  => (1 == 1)}), '{"true":true}',
            'JSON true works');
        is(ref(boolean::TO_JSON(true)), 'SCALAR',
            'Make sure we can call boolean::TO_JSON($b)');
    }
};
