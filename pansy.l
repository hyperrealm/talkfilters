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

%option prefix="pansy_yy"
%option outfile="lex.yy.c"
%option noyywrap

%e 2000
%p 6000
%n 1000
%k 500
%a 4000
%o 2000

BW	[ \t]
EW	[ \t.,;!?]
EOT	\4

%{

#include "common.h"
#include "talkfilters.h"

#define YY_DECL int yylex(gtf_databuf_t *buf)

%}

%%

\<(\/)?[A-Za-z][^\>]*\>      gtf_echo(); /* don't damage HTML tags */

"ise"		gtf_puts("izthe");
" man "		gtf_puts(" bitch ");
guy		gtf_puts("babe");
woman		gtf_puts("huthy");
girlfriend	gtf_puts("thlut");
boyfriend	gtf_puts("lover");
handsome	gtf_puts("beautiful");
nice		gtf_puts("wonderful");
great		gtf_puts("fabuluth");
good		gtf_puts("thplendid");
bad		gtf_puts("nathty");
fag		gtf_puts("queen");
faggot		gtf_puts("piethe of wood");
"xch"		gtf_puts("kthch");
"xc"		gtf_puts("kth");
"es "		gtf_puts("ezth ");
"sh"		gtf_puts("sh");
"Sh"		gtf_puts("Sh");
"ous"		gtf_puts("uth");
S+		gtf_puts("Th");
s+		gtf_puts("th");
Z+		gtf_puts("Zth");
z+		gtf_puts("zth");
ce		gtf_puts("the");
ci		gtf_puts("thi");
cy		gtf_puts("thy");
Cy		gtf_puts("Thy");
Ce		gtf_puts("The");
Ci		gtf_puts("Thi");
x		gtf_puts("kth");
!+		gtf_puts(".  Mmmh, yeth!");
[a-e]"."	gtf_printf("%s  You know, honey?", yytext);
[f-j]"."	gtf_printf("%s  Like, ooh.", yytext);
[k-o]"."	gtf_printf("%s  Let me tell you...", yytext);
[p-t]"."	gtf_printf("%s  Mmmh.", yytext);
[u-z]"."	gtf_printf("%s  Fabuluth!", yytext);

{EOT}			/* ignore trailing EOT character */
.		gtf_echo();
\n		gtf_echo();

%%

/*
 */

#ifdef LIBRARY_MODE

int gtf_filter_pansy(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_pansy(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_pansy(input, buf, bufsz));
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
