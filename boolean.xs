#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = boolean		PACKAGE = boolean		

PROTOTYPES: DISABLE

SV*
true ()
        CODE:
        RETVAL = &PL_sv_yes;
        OUTPUT:
            RETVAL

SV*
false ()
        CODE:
        RETVAL = &PL_sv_no;
        OUTPUT:
            RETVAL

SV*
null ()
        CODE:
        RETVAL = &PL_sv_undef;
        OUTPUT:
            RETVAL

SV*
isBoolean (scalar)
        SV* scalar;
        CODE:
        if ((scalar == &PL_sv_no) || (scalar == &PL_sv_yes))
            RETVAL = &PL_sv_yes;
        else
            RETVAL = &PL_sv_no;
        OUTPUT:
            RETVAL

SV*
isTrue (scalar)
        SV* scalar;
        CODE:
        RETVAL = (scalar == &PL_sv_yes) ? &PL_sv_yes : &PL_sv_no;
        OUTPUT:
            RETVAL

SV*
isFalse (SV *scalar)
        CODE:
        RETVAL = (scalar == &PL_sv_no) ? &PL_sv_yes : &PL_sv_no;
        OUTPUT:
            RETVAL

SV*
isNull (SV *scalar)
        CODE:
        RETVAL = (scalar == &PL_sv_undef) ? &PL_sv_yes : &PL_sv_no;
        OUTPUT:
            RETVAL

