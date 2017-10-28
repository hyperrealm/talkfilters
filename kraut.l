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

%option prefix="kraut_yy"
%option outfile="lex.yy.c"
%option noyywrap

%e 2000
%p 5000
%n 1000
%k 500
%a 4000
%o 2000

%{

#include "common.h"
#include "talkfilters.h"

#define YY_DECL int yylex(gtf_databuf_t *buf)

%}

BW	[ \t]
EW	[ \t.,;!?]
EOT	\4

%%

\<(\/)?[A-Za-z][^\>]*\>      gtf_echo(); /* don't damage HTML tags */

"Why "		gtf_printf("Warum ");
"[Dd]amn"       gtf_puts_case("verdammt");
"dammit"	gtf_printf("Gott verdammt");
ing		gtf_printf("inkt");
"Chev(y|rolet)"	gtf_printf("Volkswagen");
" not "		gtf_printf(" nicht ");
" not."		gtf_printf("nicht.");
" not?"		gtf_printf("nicht?");
" not!"		gtf_printf("nicht!");
" the "		gtf_printf(" ze ");
"The "		gtf_printf("Ze ");
" with "	gtf_printf(" mit ");
"With "		gtf_printf("Mit ");
wr		gtf_printf("w-r-r");
Wr		gtf_printf("W-r-r");
R		gtf_printf("R-r-r");
" r"		gtf_printf(" r-r-r");
"Yes "		gtf_printf("Jawohl ");
"Yes."		gtf_printf("Jawohl.");
"Yes!"		gtf_printf("Jawohl!");
"YES!"		gtf_printf("JAWOHL!");
" yes "		gtf_printf(" ja ");
" yes."		gtf_printf(" ja.");
" yes!"		gtf_printf(" ja!");
"No "		gtf_printf("Nein ");
"No!"		gtf_printf("Nein!");
"No?"		gtf_printf("Nein?");
" no "		gtf_printf(" nein ");
" no."		gtf_printf(" nein.");
" no!"		gtf_printf(" nein!");
" no?"		gtf_printf(" nein?");
[Mm]"r."	gtf_printf("Herr");
[Mm]"rs."	gtf_printf("Frau");
Miss		gtf_printf("Fraulein");
" of "		gtf_printf(" uff ");
"Of "		gtf_printf("Uff ");
[M]y		gtf_puts_case("mein");
" and "		gtf_printf(" und ");
"And "		gtf_printf("Und ");
"One "		gtf_printf("Ein ");
" one"		gtf_printf(" ein");
"Is "		gtf_printf("Ist ");
" is "		gtf_printf(" ist ");
"ow "		gtf_printf("ow ");
"w "		gtf_printf("w ");
[Ss]h		gtf_puts_case("sch");
[Cc]h		gtf_puts_case("ch");
" c"		gtf_printf(" k");
" C"		gtf_printf(" K");
[Vv]		gtf_puts_case("f");
" w"		gtf_printf(" v");
W		gtf_printf("V");
[Tt]his         gtf_puts_case("das");
[Tt]h		gtf_puts_case("d");
[Ww]illiam|[Bb]ill|[Bb]rad	gtf_printf("Wilhelm");
[Gg]ary		gtf_printf("Gerhardt");
[Jj]o(h)?n	gtf_printf("Hans");
[Ss]mith	gtf_printf("Schultz");
[a-f]"!"	gtf_printf("%s Naturlich!", yytext);
[g-m]"!"        gtf_printf("%s Scheisse!", yytext);

{EOT}		/* ignore trailing EOT character */
.		gtf_echo();
\n		gtf_printf("\n");

%%

#ifdef LIBRARY_MODE

int gtf_filter_kraut(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_kraut(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_kraut(input, buf, bufsz));
}

#else /* LIBRARY_MODE */

int main(int argc, char **argv)
  {
  gtf_parse_args();

  yylex(NULL);

  return(EXIT_SUCCESS);
  }

#endif /* LIBRARY_MODE */

/* end of source file */
