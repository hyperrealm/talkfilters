dnl Process this file with autoconf to produce a configure script.
AC_INIT(talkfilters, 2.3.8, hyperrealm@gmail.com, talkfilters,
  [https://hyperrealm.github.io/talkfilters/])
AC_CONFIG_AUX_DIR([aux-build])
AC_CANONICAL_TARGET
AM_INIT_AUTOMAKE
AM_CONFIG_HEADER(config.h)

dnl Checks for programs.
AC_PROG_INSTALL
AC_PROG_CC

AM_PROG_LEX
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

AC_LIBTOOL_WIN32_DLL
AC_PROG_LIBTOOL

dnl Checks for libraries.

dnl AC_CHECK_LIB(fl, main)

dnl Checks for header files.
AC_HEADER_STDC
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


AC_OUTPUT(Makefile doc/Makefile talkfilters.pc)
