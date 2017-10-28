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

%option prefix="austro_yy"
%option outfile="lex.yy.c"
%option noyywrap
%option nounput

%e 2000
%p 5000
%n 1000
%k 500
%a 4000
%o 2000

BW [ \t]
EW [ \t.,;!?]
EOT \4

%{

#include "common.h"
#include "talkfilters.h"

#define YY_DECL int yylex(gtf_databuf_t *buf)

%}

%%

\<(\/)?[A-Za-z][^\>]*\>      gtf_echo(); /* don't damage HTML tags */

[Ss]ch	        gtf_puts_case("sh");
" c"		gtf_puts(" k");
" C"		gtf_puts(" K");
ec		gtf_puts("ek");
ac		gtf_puts("ak");
[Pp]h		gtf_puts_case("f");
cc		gtf_puts("c");
ee		gtf_puts("e");
ff		gtf_puts("f");
ll		gtf_puts("l");
mm		gtf_puts("m");
nn		gtf_puts("n");
pp		gtf_puts("p");
rr		gtf_puts("r");
ss		gtf_puts("s");
tt		gtf_puts("t");
[Tt]h		gtf_puts_case("z");
w		gtf_puts("v");
ou		gtf_puts("u");
"de "		gtf_puts("d ");
"le "		gtf_puts("l ");
"me "		gtf_puts("m ");
"ne "		gtf_puts("n ");
"re "		gtf_puts("r ");
"ve "		gtf_puts("v ");
[Cc]		gtf_puts_case("s");
[Pp]ie		gtf_puts_case("mozer's pie");
[Ss]teak        gtf_puts_case("shnitzel");
[Gg]overnor	gtf_puts_case("govenator");

{EOT}		/* ignore trailing EOT character */
.		gtf_echo();
\n		gtf_puts("\n");

%%

#ifdef LIBRARY_MODE

int gtf_filter_austro(const char *input, char *buf, size_t bufsz)
  {
  gtf_databuf_t buffer;
  YY_BUFFER_STATE _yybuf;

  gtf_strbuf_init(&buffer, buf, bufsz);
  _yybuf = yy_scan_string(input);
  yylex(&buffer);
  yy_delete_buffer(_yybuf);
  gtf_reset();

  return(buffer.overflow);
  }

int __gtf_filter_austro(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_austro(input, buf, bufsz));
}

#else /* LIBRARY_MODE */

int main(int argc, char **argv)
  {
  gtf_parse_args();
  gtf_random_seed();

  yylex(NULL);

  return(EXIT_SUCCESS);
  }

#endif /* LIBRARY_MODE */

/* end of source file */
