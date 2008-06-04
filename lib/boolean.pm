package boolean;
use 5.005003;
use strict;
$boolean::VERSION = '0.12';

use XSLoader;
XSLoader::load 'boolean';

use base 'Exporter';

@boolean::EXPORT_OK = qw(
    true false isTrue isFalse isBoolean
    null isNull
);
%boolean::EXPORT_TAGS = (
    all => [qw(true false isTrue isFalse isBoolean)],
);

=encoding utf8

=head1 NAME

boolean - Boolean support for Perl

=head1 SYNOPSIS

    use boolean ':all';

    do &always if true;
    do &never if false;

    $guess = int(rand(2)) % 2 ? true : false;

    do &something if isTrue($guess);
    do &something_else if isFalse($guess);

=head1 DESCRIPTION

Most programming languages have a native C<Boolean> data type.
Perl does not.

Perl has a simple and well known Truth System. The following scalar
values are false:

    $false1 = undef;
    $false2 = 0;
    $false3 = 0.0;
    $false4 = '';
    $false5 = '0';

Every other scalar value is true.

A lesser known aspect of Perl is that its C API has two constant scalar
values:

=over

=item C<PL_sv_yes>

This is the "true" SV. It is a Perl internals constant scalar with a
value of 1. See L<perlapi> for more info.

=item C<PL_sv_no>

This is the "false" SV. It is a Perl internals constant scalar with a
value of ''. See L<perlapi> for more info.

=back

The C<boolean> module exposes these obscure values as the subroutines
C<true> and C<false>. Finding meaningful ways to use these in a Perl
program is left as an exercise for the reader.

=head1 IMPORTABLE SUBROUTINES

This module does not export any subroutines by default. It exports all
of the following subroutines if you use the following invocation:

    use boolean ':all';

=head2 true

    true()

This function always returns a scalar whose value is the Perl internals
constant C<PL_sv_yes>. The function acts like a constant and thus takes
no input parameters.

=head2 false

    false()

This function always returns a scalar whose value is the Perl internals
constant C<PL_sv_no>. The function acts like a constant and thus takes
no input parameters.

=head2 isTrue

    isTrue($scalar)

Returns C<true> if the scalar passed to it is actually C<PL_sv_yes>.
Returns C<false> otherwise.

=head2 isFalse

    isFalse($scalar)

Returns C<true> if the scalar passed to it is actually C<PL_sv_no>.
Returns C<false> otherwise.

=head2 isBoolean

    isBoolean($scalar)

Returns C<true> if the scalar passed to it is actually C<PL_sv_yes> or
C<PL_sv_no>. Returns C<false> otherwise.

=head1 OTHER IMPORTABLE SUBROUTINES

It turns out that the value for C<undef> works out the same as true and
false in Perl internals. All scalar values set to undef actually point
to the same scalar value internally, C<PL_sv_undef>.

This module exposes corresponding subroutines for the undef value,
giving it the name "C<null>" to match common programming language
terminology.

=head2 null()

This function always returns a scalar whose value is the Perl internals
constant C<PL_sv_undef>. The function acts like a constant and thus takes
no input parameters.

=head2 isNull($scalar)

Returns C<true> if the scalar passed to it is actually C<PL_sv_undef>.
Returns C<false> otherwise.

=head1 YAML AND JSON

It is true by definition that all valid JSON streams are valid YAML
streams. The YAML and JSON specification writers have worked together to
ensure this.

This leads to the following implications for Boolean values.

JSON supports 3 data types and null values:

    {
        "string type": "all strings are double quoted in JSON",
        "number type": [1, 2, 3.1415],
        "boolean type": [true, false],
        "null type": null
    }

Strings are always double quoted. All hash keys are strings (thus
quoted). Only numbers (integer and floating point) boolean values and
null values are unquoted.

I recommend that all Perl YAML and JSON implementations always Dump
scalar strings with the value "true", "false" or "null", using quotes.

Unquoted values of this set can be Loaded into Perl using the same
constants as C<boolean.pm> does. When these values are Dumped they are
unquoted. Pure Perl YAML and JSON implementations can use C<boolean.pm>
to accomplish this.

=head1 BUGS

Currently, assigning a boolean value to a variable causes the booleanity
to be lost. This code dies:

    $x = true;
    isBoolean($x) || isTrue($x) or die;

If you know how to solve this using SV magic or otherwise, please let me
know. I'm trying to fix it myslf now. Hoping to not need to resort to:

    setTrue($x);

=head1 AUTHOR

Ingy döt Net <ingy@cpan.org>

=head1 COPYRIGHT

Copyright (c) 2007, 2008. Ingy döt Net.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See http://www.perl.com/perl/misc/Artistic.html

=cut
