dnl Process this file with autoconf to produce a configure script.
AC_INIT([talkfilters],[2.4],[hyperrealm@gmail.com],[talkfilters],[https://hyperrealm.github.io/talkfilters/])
AC_CONFIG_AUX_DIR([aux-build])
AC_CANONICAL_TARGET
AM_INIT_AUTOMAKE
AC_CONFIG_MACRO_DIRS([m4])
AC_CONFIG_HEADERS(config.h)

dnl Checks for programs.
AC_PROG_INSTALL
AC_PROG_CC

AM_PROG_LEX(noyywrap)
if test Z"$LEX" != Zflex; then
cat <<EOF
*******************************************************************
You do not seem to have flex. While flex is not required to build
talkfilters, you may need it to regenerate the lexers if you change
any of the .l files. Other "lex" programs may not be able to handle
some of the .l files in this package.
*******************************************************************
EOF
fi

LT_INIT(win32-dll)

dnl Checks for header files.

AC_CHECK_INCLUDES_DEFAULT
AC_PROG_EGREP

AC_CHECK_HEADERS(unistd.h string.h)

dnl Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST

dnl Checks for library functions.

dnl Check for MinGW. Workaround for libtool's DLL_EXPORT stupidity.

case "$target" in
        *-*-cygwin* | *-*-mingw*)
                gnuwin=yes;;
esac

AM_CONDITIONAL(GNU_WIN, test x$gnuwin = xyes)


AC_CONFIG_FILES([Makefile doc/Makefile talkfilters.pc])
AC_OUTPUT
