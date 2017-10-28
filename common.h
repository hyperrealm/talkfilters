/* GNU Talkfilters
   Copyright (C) 1998-2003 Free Software Foundation, Inc.

   This file is part of GNU Talkfilters

   GNU Talkfilters is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License as
   published by the Free Software Foundation; either version 2, or (at
   your option) any later version.

   This software is distributed in the hope that it will be amusing, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this software; see the file COPYING.  If not, write to the
   Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
*/

#ifndef __gtf_common_h
#define __gtf_common_h

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

#if (defined WIN32) && !(defined __MINGW32__)
#define fileno _fileno
#define strcasecmp stricmp
#endif

#include "config.h"

typedef struct
  {
  char *buf;
  size_t bufsz;
  char *pos;
  size_t left;
  char overflow;
  } gtf_databuf_t;

/* We NEVER want to read from stdin when called thru the library API, but flex
 * insists on doing so anyway, so redefine YY_INPUT to always return EOF
 * immediately.
 */

#ifdef LIBRARY_MODE
#define YY_INPUT(buffer,result,max_size) YY_NULL
#endif


#define HELP_OPTION 0
#define VERSION_OPTION 1

extern void gtf_parse_args_basic(int argc, char **argv, const char *help,
                           const char *version);

#define gtf_parse_args() \
  gtf_parse_args_basic(argc, argv, GTF_HELP, GTF_VERSION)

extern void gtf_strbuf_init(gtf_databuf_t *sbuf, char *buf, size_t bufsz);

extern int gtf_strbuf_vprintf(gtf_databuf_t *buf, const char *fmt, ...);

extern int gtf_strbuf_puts(gtf_databuf_t *buf, const char *s);

extern int gtf_strbuf_putc(gtf_databuf_t *buf, char c);

#ifdef LIBRARY_MODE
#define gtf_printf(...) \
  gtf_strbuf_vprintf(buf, __VA_ARGS__)
#define gtf_putc(S) \
  gtf_strbuf_putc(buf, (S))
#define gtf_puts(S) \
  gtf_strbuf_puts(buf, (S))
#else /* LIBRARY_MODE */
#define gtf_printf printf
#define gtf_putc putchar
#define gtf_puts(S) \
  fputs((S), stdout)
#endif /* LIBRARY_MODE */

#define gtf_unput_last() \
  unput(*(yytext + yyleng - 1))

#define gtf_match_case(X, Y) \
  isupper(X) ? toupper(Y) : tolower(Y)

#define gtf_puts_case(T) \
  gtf_printf("%c%s", gtf_match_case(*yytext, *(T)), (T) + 1)

#define gtf_echo() \
  gtf_puts(yytext)

#define gtf_reset() \
  { yyrestart(NULL); BEGIN(0); }

extern void gtf_random_seed(void);

#define gtf_random(R) \
  (int)(rand() % (R))

#define GTF_HELP \
"Usage: %s [OPTIONS]\n\n\
Options:\n\
   --help                   display this help information and exit\n\
   --version                output version information and exit\n\n\
This program is a filter; it reads data from standard input, processes it,\n\
and writes the results to standard output.\n"

#define GTF_VERSION "GNU Talk Filters v" VERSION

#endif /* __gtf_common_h */
